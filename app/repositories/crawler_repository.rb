class CrawlerRepository < BaseRepository
  def initialize(user, record)
    super
  end

  def sync(params)
    record.assign_attributes({ file: params[:file] })
    record.save!
  end

  def import!
    unmappings = []
    attributes = []
    sub_categories = SubCategory.joins(:category).select(:id, :category_id, :name).group_by { |f| f.try(:name).downcase }
    categories = Category.select(:id, :name).group_by(&:id)
    companies = Company.select(:id, :name).group_by { |f| f.try(:name).downcase }
    rows = record.try(:json_from_file)
    auction_name = record.try(:filename).split('_').try(:first)
    auctions = ::Auction.where(name: auction_name).select(:id, :started_at, :ended_at).to_a
    products = ::Product.select(:id, :name).group_by { |f| f.try(:name).downcase }
    product_companies = ::ProductCompany.select(:id, :company_id, :product_id).group_by { |f| "#{f.try(:company_id)}_#{f.try(:product_id)}" }

    ApplicationRecord.transaction do
      rows.each_with_index do |row, _index|
        price = row['CurrentPrice'].to_s.gsub(',', '').to_f
        marker = row['Maker']
        model = row['Model']
        serial = row['SerialNo']
        images = []
        opened_at = Time.zone.parse(row['OpenTime'])
        closed_at = Time.zone.parse(row['ExpriedDate'])
        auction = auctions.detect { |a| a.try(:started_at) == opened_at && a.try(:ended_at) == closed_at }
        product = products[model.downcase.strip].try(:first)
        sub_category = sub_categories[row['Category1'].to_s.downcase.strip].try(:first)
        category = categories[sub_category.try(:category_id)].try(:first)
        company = companies[marker.to_s.downcase.strip].try(:first)

        if sub_category.blank? || category.blank?
          unmappings.push(row)

          next
        end

        row['TotalImage'].to_i.times do |index|
          images << formatted_url("#{auction_name}/#{model}-#{serial}", "#{index.to_s.rjust(3, '0')}.jpg")
        end

        if company.blank?
          company = make_company(marker)
          companies[marker.to_s.downcase.strip] = [company]
        end

        if product.blank?
          product = make_product(model, sub_category)
          products[model.downcase.strip] = [product]
        end

        if auction.blank?
          auction = make_auction(auction_name, opened_at, closed_at)
          auctions.push(auction)
        end

        pc_key = "#{company.try(:id)}_#{product.try(:id)}"
        pc = product_companies[pc_key].try(:first)

        if pc.blank?
          pc = make_product_company(product, company)
          product_companies[pc_key] = [pc]
        end

        attributes.push({
                          category_name: category.try(:name),
                          product_name: model,
                          product_id: product.try(:id),
                          auction_id: auction.try(:id),
                          auction_name: "#{marker}-#{model}-#{serial}",
                          serial: serial,
                          company_id: company.try(:id),
                          address: row['DeliveryPlace'],
                          marker: marker,
                          price: price,
                          source_link: row['Url'],
                          min_price: price,
                          year_of_manufacture: row['Year'],
                          used_hours: row['Hour'].to_f,
                          status: status,
                          sub_category_id: sub_category.try(:id),
                          category_id: sub_category.try(:category_id),
                          created_at: now,
                          updated_at: now,
                          images: images.to_json
                        })
      end

      ::AuctionItem.insert_all!(attributes)

      # Send email when unmappings has items
      return if unmappings.blank?
    end
  end

  private

  def formatted_url(folder, filename)
    "https://storage.googleapis.com/#{ENV.fetch('GOOGLE_BUCKET_NAME')}/uploads/img/#{folder}/#{filename}"
  end

  def make_product(model, sub_category)
    product = ::Product.new({
                              name: model,
                              short_description: model,
                              category_id: sub_category.try(:category_id),
                              sub_category_id: sub_category.try(:id),
                              skip_callback: 'create'
                            })

    product.slug = product.slug_generator
    product.save!
    product
  end

  def make_auction(auction_name, opened_at, closed_at)
    ::Auction.create!({
                        name: auction_name,
                        started_at: opened_at,
                        ended_at: closed_at,
                        color: '828282'
                      })
  end

  def make_product_company(product, company)
    ::ProductCompany.create!({
                               product_id: product.try(:id),
                               company_id: company.try(:id)
                             })
  end

  def make_company(marker)
    ::Company.create!({
                        name: marker
                      })
  end

  def now
    Time.zone.now
  end

  def status
    ::AuctionItem.statuses.values.first
  end
end

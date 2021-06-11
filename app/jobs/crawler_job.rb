class CrawlerJob < ApplicationJob
  sidekiq_options queue: :crawler_job, retry: 0

  def perform(id)
    crawler = ::Crawler.find_by(id: id, status: 'pending')

    return if crawler.blank?

    sub_categories = SubCategory.joins(:category).select(:id, :category_id, :name, 'categories.name as category_name').group_by { |f| f.try(:name).downcase }
    companies = Company.select(:id, :name).group_by { |f| f.try(:name).downcase }
    json_rows = crawler.try(:file).try(:read)
    rows = JSON.parse(json_rows)
    unmappings = []
    now = Time.zone.now
    filename = File.basename(crawler.try(:file_url).to_s).to_s
    base_folder = filename.split('_').try(:first)
    status = AuctionItem.statuses.values.first

    ApplicationRecord.transaction do
      attributes = rows.map do |row|
        price = row['CurrentPrice'].to_s.gsub(',', '').to_f
        marker = row['Maker']
        model = row['Model']
        serial = row['SerialNo']
        images = []

        sub_category = sub_categories[row['Category1'].to_s.downcase.strip].try(:first)
        company = companies[marker.to_s.downcase.strip].try(:first)

        if sub_category.blank?
          unmappings.push(row)

          next
        end

        row['TotalImage'].to_i.times do |index|
          images << formatted_url("#{base_folder}/#{model}-#{serial}", "#{index.to_s.rjust(3, '0')}.jpg")
        end

        {
          category_name: sub_category.try(:category_name),
          product_name: model,
          auction_name: "#{marker}-#{model}-#{serial}",
          serial: serial,
          company_id: company.try(:id),
          address: row['DeliveryPlace'],
          marker: marker,
          price: price,
          source_link: row['Url'],
          min_price: price,
          year_of_manufacture: Time.zone.parse("01/01/#{row['Year']}"),
          used_hours: row['Hour'],
          status: status,
          sub_category_id: sub_category.try(:id),
          category_id: sub_category.try(:category_id),
          started_at: Time.zone.strptime(row['OpenTime'], '%Y-%m-%d %H%:M'),
          ended_at: Time.zone.strptime(row['ExpriedDate'], '%Y-%m-%d %H%:M'),
          created_at: now,
          updated_at: now,
          images: images.to_json
        }
      end

      ::AuctionItem.insert_all!(attributes)

      # Send email when unmappings has items
      return if unmappings.blank?
    end
  rescue StandardError => e
    Rails.logger.error(e.message.to_s)
    Rails.logger.error(e.backtrace)
  end

  private

  def formatted_url(folder, filename)
    "https://storage.googleapis.com/#{ENV.fetch('GOOGLE_BUCKET_NAME')}/uploads/img/#{folder}/#{filename}"
  end
end

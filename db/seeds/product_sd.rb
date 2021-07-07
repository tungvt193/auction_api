puts 'START IMPORT PRODUCT'

workbook = RubyXL::Parser.parse(Rails.root.join('db/xlsx/products.xlsx'))
categories = Category.select(:id, :name)
sub_categories = SubCategory.select(:id, :name, :category_id)
other_category = categories.detect { |c| c.try(:name) == 'Thiết bị lắp kèm & khác' }
other_sub_category = sub_categories.detect { |s| s.try(:name) == 'Khác' }
companies = Company.select(:id, :name)
product_companies = ::ProductCompany.joins(:product, :company).select(:id, :company_id, 'products.name as product_name', 'companies.name as company_name')
products = ::Product.select(:id, :name)
now = Time.zone.now
sluges = []

p_attributes = []
pc_attributes = []

sequence_number = 1
pc_keyword = {}

workbook.worksheets.each_with_index do |worksheet, sheet_index|
  puts "READ DATA FROM SHEET #{worksheet.sheet_name}"

  worksheet.each_with_index do |row, index|
    puts "IMPORT PRODUCT #{index + 1}"

    next if index.zero?

    cells = row.cells.compact.map(&:value)
    cat_name = cells[2].to_s.downcase.gsub('máy', '').gsub('xúc đào', 'máy xúc').strip
    sub_name = cells[3].to_s.downcase.gsub('máy', '').gsub('đào ', '').strip
    com_name = cells[4].to_s.downcase

    ceg = categories.detect { |c| c.try(:name).to_s.downcase.include?(cat_name) }
    seg = sub_categories.detect { |c| c.try(:name).to_s.downcase.include?(sub_name) }
    com = companies.detect { |c| c.try(:name).to_s.downcase == com_name }
    pc = product_companies.detect { |f| f.try(:product_name) == cells[7] && f.company_id == com.try(:id) }
    pd = products.detect { |f| f.try(:name) == cells[7] }

    if ceg.blank?
      ceg = other_category
      seg = other_sub_category
    end

    seg = other_sub_category if seg.blank?

    next if pc.present?

    if pd.present?
      pc_attributes.push({
                           product_id: pd.try(:id),
                           company_id: com.try(:id),
                           created_at: now,
                           updated_at: now
                         })

      pc_keyword[pd.try(:id)] = pc_keyword[pd.try(:id)].concat([com.try(:name).to_s])
      next
    end

    slug = "#{com.try(:name)} #{cells[7]}".downcase.tr(VIETNAMESE_CHARACTERS, ENGLISH_CHARACTERS).parameterize.truncate(80, omission: '')

    next if sluges.include?(slug)
    next if cells[7].blank?

    product_id = sequence_number + 1

    p_attributes.push({
                        id: product_id,
                        name: cells[7],
                        category_id: ceg.try(:id),
                        sub_category_id: seg.try(:id),
                        status: 'active',
                        model: cells[5],
                        product_type: sheet_index,
                        short_description: cells.compact.join(', '),
                        slug: slug,
                        score: 0.0,
                        skip_callback: 'create',
                        created_at: now,
                        updated_at: now,
                        keyword: [
                          cells[7].to_s,
                          ceg.try(:name).to_s,
                          seg.try(:name).to_s,
                          cells.compact.join(', '),
                          cells[5].to_s
                        ].uniq.join(', ').try(:downcase)
                      })

    pc_attributes.push({
                         company_id: com.try(:id),
                         product_id: product_id,
                         created_at: now,
                         updated_at: now
                       })

    pc_keyword[product_id] = [com.try(:name).to_s]

    sluges.push(slug)
    sequence_number += 1
  end
end

product_attributes = p_attributes.map do |product|
  cp_keywords = pc_keyword[product[:id]].join(', ')
  keyword = [product[:keyword], cp_keywords].join(', ').try(:downcase)
  non_vi_keyword = keyword.tr(VIETNAMESE_CHARACTERS, ENGLISH_CHARACTERS)

  product.merge({
                  keyword: [keyword.split(', '), non_vi_keyword.split(', ')].flatten.uniq.join(', ')
                })
end

::Product.insert_all!(product_attributes.uniq) if product_attributes.present?
::ProductCompany.insert_all!(pc_attributes.uniq) if pc_attributes.present?
::Product.import force: true, refresh: true, return: 'errors'

puts 'FINISH IMPORT PRODUCT'

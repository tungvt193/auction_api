puts 'START IMPORT PRODUCT'

workbook = RubyXL::Parser.parse('/Users/john/Desktop/products.xlsx')
categories = Category.select(:id, :name)
sub_categories = SubCategory.select(:id, :name, :category_id)
other_category = categories.detect { |c| c.try(:name) == 'Thiết bị lắp kèm & khác' }
other_sub_category = sub_categories.detect { |s| s.try(:name) == 'Khác' }
companies = Company.select(:id, :name)
product_companies = ::ProductCompany.joins(:product, :company).select(:id, :company_id, 'products.name as product_name', 'companies.name as company_name')
products = ::Product.select(:id, :name)
now = Time.zone.now
sluges = []

p_attributes, pc_attributes = [], []

sequence_number = 1

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
                        skip_callback: 'create',
                        created_at: now,
                        updated_at: now
                      })

    pc_attributes.push({
                        company_id: com.try(:id),
                        product_id: product_id,
                        created_at: now,
                        updated_at: now
                      })

    sluges.push(slug)
    sequence_number += 1
  end
end

::Product.insert_all!(p_attributes.uniq) if p_attributes.present?
::ProductCompany.insert_all!(pc_attributes.uniq) if pc_attributes.present?

::Product.elasticsearch_import

puts 'FINISH IMPORT PRODUCT'

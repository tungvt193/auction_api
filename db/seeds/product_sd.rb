puts 'START IMPORT PRODUCT'

json_data = File.read(Rails.root.join('db/jsons/products.json'))
products = JSON.parse(json_data)

now = Time.zone.now

categories = Category.select(:id, :name)
companies = Company.select(:id, :name)
other_category = categories.detect { |cat| cat.try(:name) == 'Khác' }

products.each_with_index do |product, index|
  puts "MAKE PRODUCT #{index + 1} / #{products.size}"

  e_companies = companies.select { |com| product['cm'].split(',').include?(com.try(:name)) }
  cx = categories.to_a.detect { |c| product['ca'].to_s.downcase.include?(c.try(:name).downcase) }
  cx = other_category if cx.blank?

  company_attributes = e_companies.map { |e_company| { company_id: e_company.try(:id) } }

  pro = Product.new(
    name: product['name'],
    category_id: cx.try(:id),
    status: 'active',
    created_at: now,
    updated_at: now,
    short_description: Faker::Quote.matz,
    product_companies_attributes: company_attributes
  )

  pro.thumb = Product.download_file(index, product['im'])
  pro.save!
end

puts 'FINISH IMPORT PRODUCT'

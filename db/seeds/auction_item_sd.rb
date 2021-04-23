puts 'START IMPORT AUCTION'

now = Time.zone.now

record_attributes = []
auctions = ::Auction.select(:id, :name)
product_companies = ::ProductCompany.select(:company_id, :product_id)
companies = ::Company.select(:id, :name)
statuses = ::AuctionItem.statuses.values
products = ::Product.joins(:category).where(id: product_companies.select(:product_id)).select(:id, :name, :category_id, 'categories.name as category_name')

Faker::Config.locale = 'ja'

50.times.map do |time|
  puts "MAKE AUCTION #{time} / 10"

  product = products.sample
  auction = auctions.sample
  product_company = product_companies.detect { |c| c.try(:product_id) == product.try(:id) }
  company = companies.detect { |c| c.try(:id) == product_company.try(:company_id) }

  price = rand(10_000_000_000_000)
  used_hours = rand(10_000_000)

  record_attributes.push({
                           product_name: product.try(:name),
                           category_name: product.try(:category_name),
                           auction_name: auction.try(:name),
                           status: statuses.sample,
                           auction_id: auction.try(:id),
                           product_id: product.try(:id),
                           category_id: product.try(:category_id),
                           price: price,
                           min_price: price - 10_000_000,
                           marker: company.try(:name),
                           serial: rand(10_000_000),
                           address: Faker::Address.full_address,
                           company_id: company.try(:id),
                           source_link: 'https://source.unsplash.com/1600x900/?machine',
                           images: 'https://source.unsplash.com/1600x900/?machine',
                           used_hours: used_hours,
                           year_of_manufacture: Faker::Date.between(from: 10.years.ago, to: Time.zone.today),
                           created_at: now,
                           updated_at: now
                         })
end

AuctionItem.insert_all!(record_attributes)

puts 'FINISH IMPORT AUCTION'

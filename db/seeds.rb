# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Rails.env.production?
  FileUtils.rm_rf('public/downloads')
  FileUtils.rm_rf('public/uploads')

  Province.delete_all
  District.delete_all
  Ward.delete_all
  User.delete_all
  Category.delete_all
  SubCategory.delete_all
  Banner.delete_all
  Company.delete_all
  ProductCompany.delete_all
  Product.delete_all
  Auction.delete_all
  AuctionItem.delete_all
  News.delete_all
  Notification.delete_all
  Booking.delete_all
  Rate.delete_all
  Video.delete_all
  OrderItem.delete_all
  Order.delete_all

  load Rails.root.join('db/seeds/administrative_division_sd.rb')
  load Rails.root.join('db/seeds/user_sd.rb')
  load Rails.root.join('db/seeds/category_sd.rb')
  load Rails.root.join('db/seeds/sub_category_sd.rb')
  load Rails.root.join('db/seeds/banner_sd.rb')
  load Rails.root.join('db/seeds/company_sd.rb')
  load Rails.root.join('db/seeds/product_sd.rb')
  load Rails.root.join('db/seeds/auction_sd.rb')
  load Rails.root.join('db/seeds/auction_item_sd.rb')
  load Rails.root.join('db/seeds/news_sd.rb')
  load Rails.root.join('db/seeds/notification_sd.rb')
  load Rails.root.join('db/seeds/booking_sd.rb')
  load Rails.root.join('db/seeds/rate_sd.rb')
  load Rails.root.join('db/seeds/video_sd.rb')
  load Rails.root.join('db/seeds/order_sd.rb')
end

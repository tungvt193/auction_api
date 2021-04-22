# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Category.delete_all
Banner.delete_all
Company.delete_all
ProductCompany.delete_all
Product.delete_all

load Rails.root.join('db', 'seeds', 'user_sd.rb')
load Rails.root.join('db', 'seeds', 'category_sd.rb')
load Rails.root.join('db', 'seeds', 'banner_sd.rb')
load Rails.root.join('db', 'seeds', 'company_sd.rb')
load Rails.root.join('db', 'seeds', 'product_sd.rb')
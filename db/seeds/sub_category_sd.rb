puts 'START IMPORT SUB CATEGORY'

category_ids = ::Category.pluck(:id)
now = Time.zone.now

50.times do |index|
  puts "MAKE SUB CATEGORY #{index + 1} / 10"
  r_name = (0...3).map { ('a'..'z').to_a[rand(26)] }.join.upcase
  subcate = ::SubCategory.new({
                                name: r_name,
                                status: 'active',
                                created_at: now,
                                updated_at: now,
                                position: index,
                                category_id: category_ids.sample
                              })
  puts 'MAKE SUB CATEGORY SUCCESS' if subcate.save!
end

puts 'FINISH IMPORT SUB CATEGORY'

puts 'START IMPORT SUB CATEGORY'

json_data = File.read(Rails.root.join('db/jsons/sub_categories.json'))
sub_categories = JSON.parse(json_data)
now = Time.zone.now

sub_categories.each_with_index do |sub_category, index|
  puts "MAKE SUB CATEGORY #{index + 1} / #{sub_categories.size}"
  sub_cat = SubCategory.new(
    name: sub_category['name'],
    english_name: sub_category['english_name'],
    category_id: sub_category['category_id'],
    created_at: now,
    updated_at: now,
    position: index
  )

  sub_cat.save!
end

puts 'FINISH IMPORT CATEGORY'

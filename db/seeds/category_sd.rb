puts 'START IMPORT CATEGORY'

json_data = File.read(Rails.root.join('db/jsons/categories.json'))
categories = JSON.parse(json_data)
now = Time.zone.now
base_im_url = Rails.root.join('db/images/').to_s

categories.each_with_index do |category, index|
  puts "MAKE CATEGORY #{index + 1} / #{categories.size}"
  cat = Category.new(
    id: category['id'],
    name: category['name'],
    english_name: category['english_name'],
    status: 'active',
    created_at: now,
    updated_at: now,
    position: index
  )

  cat.thumb = File.new(base_im_url + category['thumb'])
  cat.save!
end

puts 'FINISH IMPORT CATEGORY'

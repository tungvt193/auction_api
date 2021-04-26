puts 'START IMPORT CATEGORY'

names = ['Máy xúc mini', 'Máy xúc', 'Máy xúc lật', 'Máy ủi', 'Con lăn', 'Máy san đất', 'Máy hoàn thiện', 'Cần cẩu', 'Máy móc xây dựng khác', 'Xe nâng hàng', 'Máy phát điện', 'Máy hàn', 'Máy nén khí', 'Phụ tùng', 'Bộ phận', 'Mục nhỏ', 'Xe tải tự đổ', 'Xe tải', 'Các loại xe khác', 'Máy kéo', 'Máy nông nghiệp khác', 'Những loại khác']

now = Time.zone.now

names.each_with_index do |name, index|
  puts "MAKE CATEGORY #{index + 1} / #{names.size}"

  cat = Category.new(
    name: name,
    status: 'active',
    created_at: now,
    updated_at: now
  )

  cat.thumb = Category.download_image(index, 'https://source.unsplash.com/1600x900/?truck')
  cat.save!
end

puts 'FINISH IMPORT CATEGORY'

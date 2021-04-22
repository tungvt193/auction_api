puts "START IMPORT CATEGORY"

names = [
  'Máy xúc bánh xích',
  'Xúc lật',
  'Máy ủi',
  'Xe cẩu',
  'Máy rải, thiết bị bê tông, giao thông',
  'Xe nâng hàng',
  'Máy nén Máy phát điện Máy hàn',
  'Phụ tùng Đồ lắp kèm sản phẩm khác'
]

now = Time.zone.now

names.each_with_index do |name, index|
  "MAKE CATEGORY #{index + 1} / #{names.size}"

  cat = Category.new(
    name: name,
    status: 'active',
    created_at: now,
    updated_at: now
  )

  cat.thumb = Category.download_image(index, 'https://source.unsplash.com/1600x900/?machine')
  cat.save!
end

puts "FINISH IMPORT CATEGORY"
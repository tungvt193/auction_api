puts 'START IMPORT NOTIFICATION'

user_ids = ::User.admin.pluck(:id)

user_ids.each_with_index do |user_id, index|
  puts "MAKE NOTIFICATION #{index} / 10"

  20.times do |_time|
    n = ::Notification.new({
                             title: Faker::Book.title,
                             notification_type: %i[owner global].sample,
                             message: Faker::Quote.matz,
                             status: %i[unread readed].sample,
                             image_url: 'https://source.unsplash.com/1600x900/?truck',
                             user_id: user_id
                           })

    puts 'MAKE NOTIFICATION SUCCESS' if n.save!
  end
end

puts 'FINISH IMPORT NOTIFICATION'

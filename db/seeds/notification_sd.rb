puts 'START IMPORT NOTIFICATION'

user_ids = ::User.admin.pluck(:id)

20.times do |_time|
  n = ::Notification.new({
                           title: Faker::Book.title,
                           notification_type: 'owner',
                           message: Faker::Quote.matz,
                           status: %i[unread readed].sample,
                           image_url: 'https://source.unsplash.com/1600x900/?truck',
                           user_id: user_ids.sample
                         })

  puts 'MAKE NOTIFICATION SUCCESS' if n.save!
end

20.times do |_time|
  n = ::Notification.new({
                           title: Faker::Book.title,
                           notification_type: 'global',
                           message: Faker::Quote.matz,
                           status: %i[unread readed].sample,
                           image_url: 'https://source.unsplash.com/1600x900/?truck'
                         })

  puts 'MAKE NOTIFICATION SUCCESS' if n.save!
end

puts 'FINISH IMPORT NOTIFICATION'

puts 'START IMPORT USER'

roles = User.roles.keys
genders = %w[male female]
now = Time.zone.now

10.times.map do |time|
  puts "MAKE USER #{time} / 10"

  avatar_url = LocalImages::Faces.local_link('humans')
  role = time == 2 ? 'admin' : roles.sample

  user = User.new(
    email: "user-#{time}@example.com",
    role: role,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number.gsub(' ', ''),
    gender: genders.sample,
    created_at: now,
    updated_at: now
  )

  user.password = 'Bidma@2021'
  user.avatar = File.new(avatar_url)
  user.save!
end

puts 'FINISH IMPORT USER'

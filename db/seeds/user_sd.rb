puts 'START IMPORT USER'

encrypted_password = User.new.cryptor.encrypt_and_sign('12345678')
roles = User.roles.keys
genders = %w[male female]
now = Time.zone.now

10.times.map do |time|
  puts "MAKE USER #{time} / 10"

  avatar_url = LocalImages::Faces.local_link('humans')

  user = User.new(
    email: "user-#{time}@example.com",
    encrypted_password: encrypted_password,
    role: roles.sample,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number.gsub(' ', ''),
    gender: genders.sample,
    created_at: now,
    updated_at: now
  )

  user.avatar = File.new(avatar_url)
  user.save!
end

puts 'FINISH IMPORT USER'

puts "START IMPORT USER"

user_attributes = []

encrypted_password = User.new.cryptor.encrypt_and_sign('12345678')
roles = User.roles.keys
genders = ['male', 'female']
now = Time.zone.now

user_attributes = 10.times.map do |time|
  "MAKE USER #{time} / 10"

  avatar_url = LocalImages::Faces.local_link("humans")

  user = User.new(
    email: "user-#{time}@example.com",
    encrypted_password: encrypted_password,
    role: roles.sample,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: genders.sample,
    created_at: now,
    updated_at: now
  )

  user.avatar = File.new(avatar_url)
  user.save!
end

puts "FINISH IMPORT USER"
puts 'START IMPORT NEWS'

json_data = File.read(Rails.root.join('db/jsons/newses.json'))
newses = JSON.parse(json_data)
now = Time.zone.now

newses.each_with_index do |news, index|
  puts "MAKE NEWS #{index + 1} / #{newses.size}"

  record = News.new(
    title: Faker::Quote.robin,
    short_description: Faker::Quote.matz,
    votes_total: rand(100),
    comments_count: rand(20),
    comments_total: rand(100),
    status: 'active',
    created_at: now,
    updated_at: now
  )

  record.content = News.download_file(index, news['content'], 'html')
  record.cover = News.download_file(index, 'https://source.unsplash.com/1600x900/?truck')
  record.save!
end

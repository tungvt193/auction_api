puts 'START IMPORT AUCTION'

now = Time.zone.now
auction_attributes = []

20.times.map do |time|
  puts "MAKE AUCTION #{time} / 10"
  r_name = (0...3).map { ('a'..'z').to_a[rand(26)] }.join.upcase
  color = Random.new.bytes(3).unpack("H*")[0].upcase

  from = (-15...3).to_a.sample
  to = (3...20).to_a.sample

  auction_attributes.push({
                            name: r_name,
                            started_at: from.days.from_now,
                            ended_at: to.days.from_now.end_of_day,
                            status: [0, 1].sample,
                            color: color,
                            created_at: now,
                            updated_at: now
                          })
end

Auction.insert_all!(auction_attributes)

puts 'FINISH IMPORT AUCTION'

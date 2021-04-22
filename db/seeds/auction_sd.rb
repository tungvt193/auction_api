puts "START IMPORT AUCTION"


now = Time.zone.now

auction_attributes = []

20.times.map do |time|
  "MAKE AUCTION #{time} / 10"

  r_name = (0...3).map { ('a'..'z').to_a[rand(26)] }.join.upcase
  
  auction_attributes.push({
    name: r_name,
    started_at: time.days.from_now,
    ended_at: time.days.from_now.end_of_day,
    status: 'active',
    created_at: now,
    updated_at: now,
  })
end

Auction.insert_all!(auction_attributes)

puts "FINISH IMPORT AUCTION"
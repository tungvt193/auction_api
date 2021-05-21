puts 'START IMPORT RATING'

now = Time.zone.now
auction_ids = ::Auction.pluck(:id)
user_ids = ::User.pluck(:id)

auction_ids.each_with_index do |auction_id, index|
  puts "MAKE RATING of AUCTION #{index + 1} / 20"

  5.times.map do |time|
    rating = ::Rate.new({
                          ratable_type: 'Auction',
                          ratable_id: auction_id,
                          comment: Faker::Quote.matz,
                          created_at: now,
                          updated_at: now,
                          user_id: user_ids.sample,
                          star: (0..5).to_a.sample
                        })
    puts "MAKE #{time + 1} / 5 RATING of AUCTION #{index + 1}  SUCCESS" if rating.save!
  end
  puts "MAKE RATING of AUCTION #{index + 1}  SUCCESS"
end

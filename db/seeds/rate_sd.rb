puts 'START IMPORT RATING'

now = Time.zone.now
auction_item_ids = ::AuctionItem.pluck(:id)
user_ids = ::User.pluck(:id)

auction_item_ids.each_with_index do |auction_item_id, index|
  puts "MAKE RATING of AUCTION ITEM #{index + 1} / 20"

  5.times.map do |time|
    rating = ::Rate.new({
                          ratable_type: 'AuctionItem',
                          ratable_id: auction_item_id,
                          auction_id: ::AuctionItem.find(auction_item_id).auction_id,
                          comment: Faker::Quote.matz,
                          created_at: now,
                          updated_at: now,
                          user_id: user_ids.sample,
                          star: (0..5).to_a.sample
                        })
    puts "MAKE #{time + 1} / 5 RATING of AUCTION ITEM #{index + 1}  SUCCESS" if rating.save!
  end
  puts "MAKE RATING of AUCTION #{index + 1}  SUCCESS"
end

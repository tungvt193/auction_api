puts 'START IMPORT BOOKING'

auction_items = ::AuctionItem.select(:id, :auction_id)
users = ::User.select(:id, :role)
statuses = ::Booking.statuses.keys

admins = users.select { |u| u.try(:admin?) }
customers = users.select { |u| u.try(:user?) }

100.times.map do |time|
  puts "MAKE BOOKING #{time} / 10"
  auction_item = auction_items.sample
  supporter = admins.sample
  customer = customers.sample

  b = Booking.new({
                    status: statuses.sample,
                    auction_item_id: auction_item.try(:id),
                    auction_id: auction_item.try(:auction_id),
                    user_id: customer.try(:id),
                    supporter_id: supporter.try(:id),
                    booking_at: rand(10).days.from_now
                  })
  b.save!
end

puts 'FINISH IMPORT BOOKING'

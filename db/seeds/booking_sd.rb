puts 'START IMPORT BOOKING'

auction_items = ::AuctionItem.select(:id, :auction_id)
auctions = ::Auction.select(:id, :started_at, :ended_at)
users = ::User.select(:id, :role)
statuses = ::Booking.statuses.keys
booking_types = ::Booking.booking_types.keys

admins = users.select { |u| u.try(:admin?) }
customers = users.select { |u| u.try(:user?) }

100.times.map do |time|
  puts "MAKE BOOKING #{time} / 100"
  auction_item = auction_items.sample
  supporter = admins.sample
  customer = customers.sample
  booking_type = booking_types.sample
  auction = auctions.detect { |a| a.try(:id) == auction_item.try(:auction_id) }

  next if auction.blank?

  b = Booking.new({
                    booking_type: booking_type,
                    status: statuses.sample,
                    auction_item_id: auction_item.try(:id),
                    auction_id: auction_item.try(:auction_id),
                    user_id: customer.try(:id),
                    supporter_id: supporter.try(:id),
                    booking_at: (auction.try(:started_at).to_date...auction.try(:ended_at).to_date).to_a.sample
                  })

  if booking_type == 'online'
    b.assign_attributes({
                          zoom_id: srand.to_s.last(10),
                          zoom_password: (0...6).map { rand(97..122).chr }.join
                        })
  else
    b.assign_attributes({
                          address: Faker::Address.full_address
                        })
  end
  b.save!
end

puts 'FINISH IMPORT BOOKING'

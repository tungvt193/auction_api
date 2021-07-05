module Lazy
  class LazyLastestBooking < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:id)).batch(default_value: nil, cache: false) do |ids, loader|
        ::Booking.where(auction_item_id: ids).each do |booking|
          loader.call(booking.try(:auction_item_id)) { booking }
        end
      end
    end
  end
end

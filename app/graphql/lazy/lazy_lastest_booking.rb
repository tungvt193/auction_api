module Lazy
  class LazyLastestBooking < Base
    def call(obj, _args, ctx)
      BatchLoader::GraphQL.for(obj.try(:id)).batch(default_value: nil, cache: true) do |ids, loader|
        ::Booking.where(auction_item_id: ids, user_id: ctx[:current_user].try(:id)).each do |booking|
          loader.call(booking.try(:auction_item_id)) { booking }
        end
      end
    end
  end
end

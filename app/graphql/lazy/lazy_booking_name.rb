module Lazy
  class LazyBookingName < Base
    def call(obj, _args, _ctx)
      booking_name(obj.try(:auction_item))
    end

    def booking_name(auction_item)
      "#{auction_item.company.name} #{auction_item.auction_name}-#{auction_item.serial}"
    end
  end
end

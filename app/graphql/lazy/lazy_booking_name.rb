module Lazy
  class LazyBookingName < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:auction_item_id)).batch(default_value: nil, cache: true) do |ids, loader|
        ::AuctionItem.joins(:company).where(id: ids).select(:id, :auction_name, :serial, 'companies.name as company_name').each do |aum|
          loader.call(aum.try(:id)) { booking_name(aum) }
        end
      end
    end

    def booking_name(aum)
      "#{aum.try(:company_name)} #{aum.auction_name}-#{aum.serial}"
    end
  end
end

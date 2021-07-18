module Lazy
  class LazyAuctionScore < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:id)).batch(default_value: nil, cache: true) do |ids, loader|
        ::Rate.where(auction_id: ids, ratable_type: 'AuctionItem').group_by(&:auction_id).each do |k, rates|
          loader.call(k) do
            r = rates.group_by(&:rounded_star)
            r1 = r['1'].try(:length).to_f
            r2 = r['2'].try(:length).to_f
            r3 = r['3'].try(:length).to_f
            r4 = r['4'].try(:length).to_f
            r5 = r['5'].try(:length).to_f

            r_totals = r1 + r2 + r3 + r4 + r5

            ::OpenStruct.new({
                               one: percentage(r1, r_totals),
                               two: percentage(r2, r_totals),
                               three: percentage(r3, r_totals),
                               four: percentage(r4, r_totals),
                               five: percentage(r5, r_totals)
                             })
          end
        end
      end
    end

    private

    def percentage(score, r_totals)
      return 0 if r_totals.zero?

      score * 100 / r_totals
    end
  end
end

module Lazy
  class LazyAuctionImage < Base
    def call(obj, _args, _ctx)
      obj.try(:images).to_s.split(',')
    end
  end
end

require 'httparty'

class Estimated
  class << self
    def vn_transport_fee
      {
        size_20_feet: 175_000,
        size_10_ton: 400_000,
        size_20_ton: 500_000,
        size_30_ton: 900_000
      }
    end

    def clearance_fee
      {
        size_20_feet: 15_000,
        size_10_ton: 15_000,
        size_20_ton: 15_000,
        size_30_ton: 15_000
      }
    end

    def registry_fee
      {
        size_20_feet: 10_000,
        size_10_ton: 15_000,
        size_20_ton: 16_000,
        size_30_ton: 20_000
      }
    end

    def vcb_exrate
      r = cache.read('EXRATE_VCB')

      return r if r.present?

      response = HTTParty.get(exrate_vcb_url)
      xrs = response.
            try(:fetch, 'ExrateList', {}).
            try(:fetch, 'Exrate', []).
            map { |f| { f['CurrencyCode'] => f['Sell'].gsub(',', '').to_f } }.
            reduce({}, :merge)
      cache.write('EXRATE_VCB', xrs)

      xrs
    end

    private

    def exrate_vcb_url
      ENV['EXRATE_VCB_URL'].to_s
    end

    def cache
      ActiveSupport::Cache::MemoryStore.new
    end
  end
end

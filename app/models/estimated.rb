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

    def estimate(product, price)
      # Tỷ giá
      exrate = vcb_exrate
      # Vận chuyển về cảng Việt Nam  (JPY)
      vn_transport_fee = product.try(:vn_transport_fee).to_f
      # Phí giải toả hàng (JPY)
      clearance_fee = product.try(:clearance_fee).to_f
      # Thành giá (JPY)
      estimated_fee = price.to_f + vn_transport_fee + clearance_fee
      # Thuế nhập khẩu
      imported_fee = estimated_fee.dup
      # Tý giá tạm tính (VND/JPY)
      jp_to_vnd = imported_fee * exrate['JPY'].to_f
      # Thuế VAT (VND)
      vat_tax = jp_to_vnd * 1.1
      # Phí chuyển tiền ngân hàng (VND)
      bank_transport_fee = (estimated_fee * 0.2 + 600) * 1.1 * exrate['JPY'].to_f
      # Chi phí thông quan, đăng kiểm, Vận chuyển (VND)
      registry_fee = product.try(:vn_registry_fee).to_f
      # Tổng giá thành (VND)
      total_price = vat_tax + bank_transport_fee + registry_fee
      # Phí ủy thác (VND)
      entrustment_fee = take_entrustment_fee(jp_to_vnd)

      ::OpenStruct.new({
                         exrate: exrate['JPY'],
                         vn_transport_fee: vn_transport_fee,
                         clearance_fee: clearance_fee,
                         estimated_fee: estimated_fee,
                         imported_fee: imported_fee,
                         jp_to_vnd: jp_to_vnd,
                         vat_tax: vat_tax,
                         bank_transport_fee: bank_transport_fee,
                         registry_fee: registry_fee,
                         total_price: total_price,
                         entrustment_fee: entrustment_fee,
                         final_price: total_price + entrustment_fee
                       })
    end

    private

    def exrate_vcb_url
      ENV['EXRATE_VCB_URL'].to_s
    end

    def cache
      ActiveSupport::Cache::MemoryStore.new
    end

    def take_entrustment_fee(jp_to_vnd)
      return jp_to_vnd * 0.02 if jp_to_vnd.try(:between?, 1_000_000_000, 2_000_000_000)
      return jp_to_vnd * 0.01 if jp_to_vnd.to_f > 2_000_000_000

      jp_to_vnd * 0.03
    end
  end
end

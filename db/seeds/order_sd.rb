puts 'START IMPORT ORDER'

statuses = Order.statuses.keys
payment_types = Order.payment_types.keys
user_ids = User.user.pluck(:id)
auction_items = AuctionItem.select(:id, :auction_id, :auction_id, :product_id, :price)
products = ::Product.select(:id, :product_type)

100.times do |t|
  puts "INSERT ORDER #{t}/100"
  take_auction_items = auction_items.take(2)
  price = 0

  order_item_attributes = take_auction_items.map do |auction_item|
    product = products.detect { |f| f.try(:id) == auction_item.try(:product_id) }
    json_estimated = ::Estimated.estimate(product, auction_item.try(:price)).as_json
    estimated_attributes = json_estimated.try(:fetch, 'table', {})

    price += estimated_attributes.try(:fetch, 'final_price', 0)

    {
      auction_item_id: auction_item.try(:id),
      auction_id: auction_item.try(:auction_id),
      product_id: auction_item.try(:product_id),
      price: auction_item.try(:price)
    }.merge(estimated_attributes)
  end

  order_attributes = {
    code: "BID-#{Time.zone.now.to_i + t}",
    cod_code: "COD-#{Time.zone.now.to_i + t}",
    status: statuses.sample,
    user_id: user_ids.sample,
    payment_type: payment_types.sample,
    price: price,
    order_items_attributes: order_item_attributes
  }

  order = ::Order.new(order_attributes)
  auction_items -= take_auction_items if order.save
end

puts 'FINISHED IMPORT ORDER'

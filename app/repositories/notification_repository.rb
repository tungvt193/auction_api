class NotificationRepository < BaseRepository
  def initialize(record)
    super(nil, record)
  end

  def make_body(type)
    case class_name
    when 'News'
      make_news_message
    when 'AuctionItem'
      make_auction_item_message(type)
    when 'Order'
      make_order_message(type)
    when 'Banner'
      make_banner_message(type)
    when 'Booking'
      make_booking_message(type)
    end
  end

  private

  def class_name
    record.try(:class).try(:name).to_s
  end

  def make_news_message
    {
      title: record.try(:title),
      notification_type: 'global',
      message: record.try(:short_description),
      data: {
        id: record.try(:id),
        type: 'News',
        content_url: record.try(:content_url),
        app_route: 'news/detail'
      }.to_json
    }
  end

  def make_auction_item_message(type)
  end

  def make_order_message(type)
    base_message = {
      title: 'Trạng thái đơn hàng',
      notification_type: 'owner',
      data: {
        id: record.try(:id),
        tab: 2,
        app_route: '/',
        sub_tab: 1
      }
    }

    case type
    when 'pending'
      base_message.merge({
                           message: "Đơn hàng có mã: #{record.try(:code)} đang chuẩn bị"
                         })
    when 'jp_warehouse'
      base_message.merge({
                           message: "Đơn hàng có mã: #{record.try(:code)} đã đến kho trung chuyển"
                         })
    when 'vn_transporting'
      base_message.merge({
                           message: "Đơn hàng có mã: #{record.try(:code)} đang luân chuyển về Việt Nam, hãy theo dõi để cập nhật trạng thái của đơn hàng"
                         })
    when 'vn_warehouse'
      base_message.merge({
                           message: "Đơn hàng có mã: #{record.try(:code)} đã đến kho Việt Nam"
                         })
    when 'waiting_delivery'
      base_message.merge({
                           message: "Đơn hàng có mã: #{record.try(:code)} đã xuất kho, đang chờ giao"
                         })
    when 'delivery'
      base_message.merge({
                           message: "Đơn hàng có mã: #{record.try(:code)} đang được giao"
                         })
    when 'delivered'
      base_message.merge({
                           title: "Đơn hàng #{ecord.try(:code)} đã hoàn tất",
                           message: 'Cảm ơn bạn đã sử dụng dịch vụ của Bid2Max. Hãy chia sẻ cảm nhận của bạn về đơn hàng để giúp những khách hàng khác có thể tham khảo nhé!'
                         })
    end
  end

  def make_banner_message(_type)
    {
      title: record.try(:title),
      notification_type: 'global',
      image_url: record.try(:cover_url),
      data: {
        id: record.try(:id),
        type: 'Banner',
        app_route: '/'
      }.to_json
    }
  end

  def make_booking_message(type)
    base_message = {
      title: 'Lịch hẹn đấu giá',
      notification_type: 'owner',
      data: {
        id: record.try(:auction_item_id),
        type: 'AuctionItem',
        app_route: 'biz/detail'
      }
    }

    case type
    when 'booked'
      [
        base_message.merge({
                             message: "Chúc mừng bạn vừa đặt thành công lịch đấu giá lúc #{record.try(:format_booking_at)}"
                           }),
        base_message.merge({
                             message: "#{record.try(:full_name)} vừa đặt lịch hẹn đấu giá lúc #{record.try(:format_booking_at)}",
                             notification_type: 'admin'
                           })
      ]
    when 'confirmed'
      base_message.merge({
                           message: "Lịch hẹn của bạn đã được xác nhận lúc #{record.try(:format_booking_at)}"
                         })
    when 'self_canceled'
      base_message.merge({
                           message: "#{record.try(:full_name)} vừa huỷ lịch hẹn đấu giá lúc #{record.try(:format_booking_at)}",
                           notification_type: 'admin'
                         })
    when 'admin_canceled'
      base_message.merge({
                           message: "lịch hẹn đấu giá đã bị huỷ do: #{reocord.canceled_reason}"
                         })
    end
  end
end

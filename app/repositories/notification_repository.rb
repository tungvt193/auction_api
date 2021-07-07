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
        route: 'news/detail'
      }.to_json
    }
  end

  def make_auction_item_message(type)
  end

  def make_order_message(type)
  end

  def make_banner_message(type)
  end

  def make_booking_message(type)
  end
end

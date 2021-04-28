class CrawlerRepository < BaseRepository
  def initialize(user, record)
    super
  end

  def sync(params)
    record.assign_attributes({ file: params[:file] })
    record.save!
  end
end

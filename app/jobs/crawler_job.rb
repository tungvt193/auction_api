class CrawlerJob < ApplicationJob
  sidekiq_options queue: :crawler_job, retry: 0

  def perform(id)
    crawler = ::Crawler.find_by(id: id, status: 'pending')
    return if crawler.blank?

    repo = ::CrawlerRepository.new(nil, crawler)
    repo.import!
  rescue StandardError => e
    Rails.logger.error(e.message.to_s)
    Rails.logger.error(e.backtrace)
  end
end

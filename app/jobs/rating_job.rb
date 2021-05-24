class RatingJob < ApplicationJob
  sidekiq_options queue: :rating_job, retry: 0

  def perform(id)
    rating = ::Rate.find_by(id: id)
    return if rating.blank?

    rating.ratable.update_average_rating
    rating.auction.update_average_rating
  end
end

require 'open-uri'

class ApplicationRecord < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  self.abstract_class = true

  def self.adjust_date_for_cdt(datetime)
    datetime.in_time_zone('UTC')
  end

  def string_id
    try(:id).try(:to_s)
  end

  scope :graphql_ransack, lambda { |params|
    ransack(params).result(distinct: true)
  }

  scope :reverse_scope, lambda {
    order(created_at: :desc)
  }

  scope :ransack_query, lambda { |params, page, per_page = 10|
    ransack(params).
      result.
      page(page).
      per(per_page)
  }

  def cryptor
    ::ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
  end

  def created_in_word
    time_ago_in_words(created_at)
  end

  def base_file_url
    return 'http://localhost:3000' if Rails.env.development?

    "https://storage.googleapis.com/#{ENV.fetch('GOOGLE_BUCKET_NAME')}"
  end

  class << self
    def download_file(prefix, url, afterfix = 'jpg')
      absolute_path = Rails.root.join('public/downloads')
      FileUtils.mkdir_p(absolute_path) unless File.directory?(absolute_path)

      img_url = absolute_path + "remote-image-#{prefix}-#{Time.zone.now.to_i}.#{afterfix}"

      File.open(img_url, 'wb') do |file|
        file << URI.open(url).read
      end

      File.new(img_url)
    end
  end
end

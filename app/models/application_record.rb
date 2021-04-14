class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.adjust_date_for_cdt(datetime)
    datetime.in_time_zone('UTC')
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
end

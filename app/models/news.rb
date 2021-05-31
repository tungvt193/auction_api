# == Schema Information
#
# Table name: news
#
#  id                :bigint           unsigned, not null, primary key
#  content           :text(65535)
#  cover             :string(255)
#  content_tmp       :string(255)
#  cover_tmp         :string(255)
#  short_description :text(65535)
#  title             :string(255)      not null
#  slug              :string(255)
#  votes_total       :bigint           default(0), not null
#  comments_count    :bigint           default(0), not null
#  comments_total    :bigint           default(0), not null
#  status            :integer          default("deactive"), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class News < ApplicationRecord
  mount_uploader :cover, ImageUploader
  mount_uploader :content, FileUploader

  store_in_background :cover
  store_in_background :content

  enum status: { deactive: 0, active: 1, popular: 2 }

  ransacker :status, formatter: proc { |v| statuses[v] }

  before_commit :slug_generator, on: :create

  def cover_url
    cover.try(:url)
  end

  def content_url
    content.try(:url)
  end

  def created_in_word
    time_ago_in_words(created_at)
  end

  def html_content
    value.optimized.read.force_encoding('utf-8')
  rescue StandardError
    '<p></p>'
  end

  private

  def slug_generator
    self.slug = title.downcase.tr(VIETNAMESE_CHARACTERS, ENGLISH_CHARACTERS).parameterize.truncate 80, omission: ''
  end
end

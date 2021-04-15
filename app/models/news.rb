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
#  status            :integer          default("deactive"), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class News < ApplicationRecord
  mount_uploader :cover, ImageUploader
  mount_uploader :content, FileUploader

  enum status: [:deactive, :active, :popular]

  def cover_url
    cover.try(:url)
  end

  def content_url
    content.try(:url)
  end
end

# == Schema Information
#
# Table name: images
#
#  id             :bigint           unsigned, not null, primary key
#  name           :string(255)
#  file           :string(255)
#  file_tmp       :string(255)
#  imageable_type :string(255)
#  imageable_id   :bigint
#  price          :float(24)        default(0.0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Image < ApplicationRecord
  mount_uploader :file, ImageUploader
  store_in_background :file

  belongs_to :imageable, polymorphic: true, optional: true

  def file_url
    file.try(:url)
  end
end

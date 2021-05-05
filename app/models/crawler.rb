# == Schema Information
#
# Table name: crawlers
#
#  id         :bigint           unsigned, not null, primary key
#  file       :string(255)
#  file_tmp   :string(255)
#  status     :integer          default("pending"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Crawler < ApplicationRecord
  mount_uploader :file, FileUploader
  store_in_background :file

  enum status: { pending: 0, success: 1, failed: 2 }

  ransacker :status, formatter: proc { |v| statuses[v] }

  def file_url
    file.try(:url)
  end
end

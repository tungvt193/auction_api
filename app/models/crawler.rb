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

  after_commit :sync_background, on: :create

  def file_url
    file.try(:url)
  end

  def json_from_file
    json = try(:file).try(:read)

    JSON.parse(json)
  rescue StandardError => e
    Rails.log.error("Error---------> #{e.message}")

    []
  end

  def filename
    File.basename(try(:file_url).to_s).to_s
  end

  private

  def sync_background
    ::CrawlerJob.perform_in(1.minute, id)
  end
end

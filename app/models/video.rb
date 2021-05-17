# == Schema Information
#
# Table name: videos
#
#  id          :bigint           unsigned, not null, primary key
#  cover_url   :string(255)
#  video_id    :string(255)      not null
#  title       :string(255)      not null
#  description :text(65535)
#  status      :integer          default("deactive"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Video < ApplicationRecord
  enum status: { deactive: 0, active: 1 }

  ransacker :status, formatter: proc { |v| statuses[v] }
end

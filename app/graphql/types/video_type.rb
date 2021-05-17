# == Schema Information
#
# Table name: videos
#
#  id          :bigint           unsigned, not null, primary key
#  cover_url   :string(255)
#  url         :string(255)      not null
#  title       :string(255)      not null
#  description :text(65535)
#  status      :integer          default("deactive"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
module Types
  class VideoType < BaseNode
    field :cover_url, String, null: true
    field :video_id, String, null: true
    field :title, String, null: true
    field :status, String, null: false
    field :description, String, null: true
  end
end

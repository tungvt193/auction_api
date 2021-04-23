# == Schema Information
#
# Table name: videos
#
#  id         :bigint           unsigned, not null, primary key
#  cover      :string(255)
#  cover_tmp  :string(255)
#  url        :string(255)      not null
#  title      :string(255)      not null
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module Types
  class VideoType < BaseNode
    field :cover_url, String, null: true
    field :url, String, null: false
    field :title, String, null: false
    field :status, String, null: false
  end
end

# == Schema Information
#
# Table name: banners
#
#  id         :bigint           unsigned, not null, primary key
#  url        :string(255)
#  cover      :string(255)
#  cover_tmp  :string(255)
#  title      :string(255)
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module Types
  class BannerType < BaseNode
    field :url, String, null: true
    field :cover_url, String, null: true
    field :title, String, null: true
    field :status, String, null: false
  end
end

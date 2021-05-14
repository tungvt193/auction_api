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
module Types
  class NewsType < BaseNode
    field :content_url, String, null: true
    field :cover_url, String, null: true
    field :short_description, String, null: true
    field :title, String, null: false
    field :slug, String, null: true
    field :votes_total, Int, null: true
    field :comments_count, Int, null: true
    field :comments_total, Int, null: true
    field :status, String, null: false
  end
end

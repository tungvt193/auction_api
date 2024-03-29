# == Schema Information
#
# Table name: images
#
#  id             :bigint           unsigned, not null, primary key
#  name           :string(255)
#  file           :string(255)
#  file_tmp       :string(255)
#  imageable_type :string(255)      not null
#  imageable_id   :bigint           not null
#  price          :float(24)        default(0.0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
module Types
  class ImageType < BaseNode
    field :name, String, null: true
    field :file_url, String, null: true
    field :imageable_type, String, null: true
    field :imageable_id, Types::GraphqlIdType, null: true
    field :price, Int, null: true
  end
end

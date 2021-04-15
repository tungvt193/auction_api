# == Schema Information
#
# Table name: banners
#
#  id         :bigint           unsigned, not null, primary key
#  url        :string(255)
#  cover      :string(255)
#  cover_tmp  :string(255)
#  title      :string(255)
#  status     :integer          default("deactive"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Banner < ApplicationRecord
  enum status: [:deactive, :active]
  
  def cover_url
    cover.try(:url)
  end
end

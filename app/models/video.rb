# == Schema Information
#
# Table name: videos
#
#  id         :bigint           unsigned, not null, primary key
#  cover      :string(255)
#  cover_tmp  :string(255)
#  url        :string(255)      not null
#  title      :string(255)      not null
#  status     :integer          default("deactive"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Video < ApplicationRecord
  enum status: [:deactive, :active]
end

# == Schema Information
#
# Table name: companies
#
#  id         :bigint           unsigned, not null, primary key
#  name       :string(255)      not null
#  logo       :string(255)
#  logo_tmp   :string(255)
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
  mount_uploader :logo, ImageUploader

  has_many :product_companies
  has_many :products, through: :product_companies

  def logo_url
    logo.try(:url)
  end
end

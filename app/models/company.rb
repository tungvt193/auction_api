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
  has_many :products

  def logo_url
    logo.try(:url)
  end
end

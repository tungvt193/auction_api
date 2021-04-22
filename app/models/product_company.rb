# == Schema Information
#
# Table name: product_companies
#
#  id         :bigint           unsigned, not null, primary key
#  product_id :bigint           not null
#  company_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ProductCompany < ApplicationRecord
  belongs_to :product
  belongs_to :company
end

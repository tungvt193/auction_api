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

module Types
  class CompanyType < BaseNode
    field :name, String, null: false
    field :status, String, null: false
    field :logo_url, String, null: true
  end
end

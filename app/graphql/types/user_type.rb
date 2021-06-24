# == Schema Information
#
# Table name: users
#
#  id                     :bigint           unsigned, not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  role                   :integer          default("user"), not null
#  gender                 :integer          default("male"), not null
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

module Types
  class UserType < BaseNode
    field :full_name, String, null: true
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :gender, String, null: true
    field :email, String, null: true
    field :phone, String, null: false
    field :birthday, String, null: true
    field :remember_created_at, String, null: true
    field :sign_in_count, Int, null: true
    field :current_sign_in_at, String, null: true
    field :last_sign_in_at, String, null: true
    field :current_sign_in_ip, String, null: true
    field :last_sign_in_ip, String, null: true
    field :role, String, null: false
    field :avatar_url, String, null: true
    field :status, String, null: false
    field :user_type, String, null: false
    field :tel, String, null: true
    field :address, String, null: true
    field :referral_id, String, null: true
    field :creator_id, String, null: true

    field :province, Types::ProvinceType, resolve: Lazy::LazyProvince.new, null: true
    field :district, Types::DistrictType, resolve: Lazy::LazyDistrict.new, null: true
    field :ward, Types::WardType, resolve: Lazy::LazyWard.new, null: true
    field :referral, Types::UserType, resolve: Lazy::LazyReferral.new, null: true
  end
end

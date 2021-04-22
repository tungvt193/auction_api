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
#  avatar                 :string(255)
#  avatar_tmp             :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  mount_uploader :avatar, ImageUploader

  enum role: [:user, :premium, :sale, :admin]
  enum gender: [:male, :female]

  has_many :auction_items

  def authenticate(password)
    cryptor.decrypt_and_verify(encrypted_password) == password
  rescue StandardError
    nil
  end

  def avatar_url
    avatar.try(:url)
  end
end

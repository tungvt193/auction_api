# == Schema Information
#
# Table name: users
#
#  id                     :bigint           unsigned, not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  phone                  :string(255)      not null
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
  store_in_background :avatar

  enum role: { user: 0, premium: 1, sale: 2, admin: 3 }
  enum gender: { male: 0, female: 1 }

  has_many :auction_items
  has_many :device_tokens, dependent: :destroy

  ransacker :role, formatter: proc { |v| roles[v] }
  ransacker :gender, formatter: proc { |v| genders[v] }

  class << self
    def by_username_and_role(username, role = 'user')
      graphql_ransack({
                        m: 'or',
                        g: {
                          '0' => {
                            email_eq: username
                          },
                          '1' => {
                            phone_eq: username
                          }
                        }
                      }).find_by(role: role)
    end
  end

  def authenticate(password)
    cryptor.decrypt_and_verify(encrypted_password) == password
  rescue StandardError
    nil
  end

  def password=(string_password)
    self.encrypted_password = cryptor.encrypt_and_sign(string_password)
  end

  def password
    cryptor.decrypt_and_verify(encrypted_password)
  end

  def avatar_url
    avatar.try(:url)
  end

  def full_name
    "#{last_name} #{first_name}"
  end

  def reset_password_url
    # TODO
  end
end

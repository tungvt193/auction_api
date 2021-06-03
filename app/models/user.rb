# == Schema Information
#
# Table name: users
#
#  id                     :bigint           unsigned, not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  phone                  :string(255)      not null
#  email                  :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  role                   :integer          default("user"), not null
#  user_type              :integer          default("normal"), not null
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
#  status                 :integer          default("deactive"), not null
#  ward_id                :bigint
#  district_id            :bigint
#  province_id            :bigint
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  mount_uploader :avatar, ImageUploader
  store_in_background :avatar

  enum role: { user: 0, admin: 1 }
  enum gender: { male: 0, female: 1 }
  enum status: { deactive: 0, active: 1, ban: 2 }
  enum user_type: { normal: 0, premium: 1, sale: 2 }

  has_many :auction_items
  has_many :device_tokens, dependent: :destroy

  ransacker :role, formatter: proc { |v| roles[v] }
  ransacker :gender, formatter: proc { |v| genders[v] }
  ransacker :status, formatter: proc { |v| statuses[v] }
  ransacker :user_type, formatter: proc { |v| user_types[v] }

  VALID_EMAIL_REGEX = Settings.validations.user.email_regex
  VALID_PASSWORD_REGEX = Settings.validations.user.password_regex

  validates :email, format: { with: VALID_EMAIL_REGEX, message: 'Email không đúng định dạng.' }, allow_blank: true
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'Mật khẩu phải có ít nhất 8 ký tự bao gồm chữ cái, số và kí tự đặc biệt, viết thường và viết hoa.' }

  class << self
    def by_username_and_role(username, role = 'user')
      where('email = ? OR phone = ?', username, username).find_by(role: role)
    end

    def by_phone_or_new(phone)
      ::User.find_by(phone: phone) || ::User.create!(phone: phone, password: random_password)
    end

    def random_password
      specials = ['!', '@', '#'].to_a
      numbers  = (0..9).to_a
      alpha    = ('a'..'z').to_a + ('A'..'Z').to_a
      %w[i I l L 1 O o 0].each { |ambiguous_character|
        alpha.delete ambiguous_character
      }
      characters = (alpha + specials + numbers)
      password = Random.new.rand(8..18).times.map { characters.sample }
      password << specials.sample unless password.join =~ Regexp.new(Regexp.escape(specials.join))
      password << numbers.sample  unless password.join =~ Regexp.new(Regexp.escape(numbers.join))
      password.shuffle.join
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
    avatar_store_url(avatar || avatar_tmp)
  end

  def avatar_store_url(file)
    "#{base_file_url}/#{avatar.try(:store_dir)}/" + File.basename(file.to_s)
  end

  def full_name
    "#{last_name} #{first_name}"
  end

  def reset_password_url
    token = generate_token(Settings.token_time.reset_password.minutes, 'reset_password')

    assign_attributes({ reset_password_token: token, reset_password_sent_at: Time.zone.now })
    "#{ENV.fetch('RESET_PASSWORD_URL')}?token=#{token}"
  end

  def save_device_token(device_token)
    return if device_token.blank?
    return if device_tokens.find_by(token: device_token).present?

    device_tokens.create({
                           token: device_token,
                           token_type: 'owner'
                         })
  end

  def generate_token(expired_time, token_type = nil)
    expired_at = expired_time.from_now.strftime('%H:%M %d/%m/%Y')

    cryptor.encrypt_and_sign("user-id:#{id}&expired-at:#{expired_at}&token-type:#{token_type}")
  end
end

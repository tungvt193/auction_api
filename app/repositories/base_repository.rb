class BaseRepository
  def initialize(user, record)
    @user = user
    @record = record
  end

  protected

  attr_reader :user
  attr_accessor :record

  def cryptor
    ::ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
  end
end

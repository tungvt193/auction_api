class BaseRepository
  def initialize(user, record)
    @user = user
    @record = record
  end

  protected

  attr_reader :user
  attr_accessor :record
end

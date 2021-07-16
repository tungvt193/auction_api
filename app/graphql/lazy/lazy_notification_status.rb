module Lazy
  class LazyNotificationStatus < Base
    def call(obj, _args, ctx)
      return true if ctx[:current_user].blank?

      obj.try(:is_readed?, ctx[:current_user])
    end
  end
end

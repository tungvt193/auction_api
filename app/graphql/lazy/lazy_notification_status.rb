module Lazy
  class LazyNotificationStatus < Base
    def call(obj, _args, ctx)
      obj.try(:is_readed?, ctx[:current_user])
    end
  end
end

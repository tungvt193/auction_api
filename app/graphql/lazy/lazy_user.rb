module Lazy
  class LazyUser < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:user_id)).batch(default_value: nil, cache: true) do |ids, loader|
        ::User.where(id: ids).each do |user|
          loader.call(user.try(:id)) { user }
        end
      end
    end
  end
end

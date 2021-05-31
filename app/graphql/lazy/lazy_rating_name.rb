module Lazy
  class LazyRatingName < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:user_id)).batch(default_value: nil, cache: false) do |ids, loader|
        ::User.where(id: ids).each do |user|
          loader.call(user.try(:id)) { user.try(:full_name).to_s }
        end
      end
    end
  end
end

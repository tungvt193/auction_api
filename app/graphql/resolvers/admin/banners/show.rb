module Resolvers
  module Admin
    module Banners
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::BannerType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end

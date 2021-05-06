module Resolvers
  module Web
    module Companies
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::CompanyType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end

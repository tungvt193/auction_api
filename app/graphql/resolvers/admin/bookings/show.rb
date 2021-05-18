module Resolvers
  module Admin
    module Bookings
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::BookingType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end

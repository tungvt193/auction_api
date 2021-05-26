module Resolvers
  module Mobile
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

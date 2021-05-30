module Resolvers
  module Mobile
    module Bookings
      class List < ::Resolvers::BaseQuery
        scope { instance_scope }
        type types[::Types::BookingType]

        option :per_page, type: types.Int, default: 10, with: :apply_per_page
        option :order_by, type: types.String, default: 'booking_at DESC', with: :apply_order

        def normalize_filters(value, branches = [])
          query = super

          scope = instance_scope.graphql_ransack(query)
          branches << scope

          branches
        end

        def fetch_results
          # NOTE: Don't run QueryResolver during tests
          return super if context.blank?

          GraphQL::QueryResolver.run(::Booking, context, ::Types::BookingType) do
            super
          end
        end

        private

        def instance_scope
          ::Booking.all
        end
      end
    end
  end
end

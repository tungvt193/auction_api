module Resolvers
  module Admin
    module Bookings
      class Summary
        include SearchObject.module(:graphql)

        scope { instance_scope }
        type types[::Types::BookingSummaryType]

        def fetch_results
          # NOTE: Don't run QueryResolver during tests
          return super if context.blank?

          GraphQL::QueryResolver.run(::Booking, context, ::Types::BookingSummaryType) do
            super
          end
        end

        private

        def instance_scope
          ::Booking.select(:id, :status).group_by(&:status).map do |key, value|
            OpenStruct.new({
                             summary_type: key,
                             bookings_total: value.size
                           })
          end
        end
      end
    end
  end
end

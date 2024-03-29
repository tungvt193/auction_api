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
          group_bookings = ::Booking.select(:id, :status).group_by(&:status)

          ::Booking.statuses.keys.map do |key|
            OpenStruct.new({
                             summary_type: key,
                             bookings_total: group_bookings.try(:fetch, key, 0).try(:size).to_i
                           })
          end
        end
      end
    end
  end
end

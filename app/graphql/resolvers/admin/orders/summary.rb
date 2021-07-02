module Resolvers
  module Admin
    module Orders
      class Summary
        include SearchObject.module(:graphql)

        scope { instance_scope }
        type types[::Types::OrderSummaryType]

        def fetch_results
          # NOTE: Don't run QueryResolver during tests
          return super if context.blank?

          GraphQL::QueryResolver.run(::Order, context, ::Types::OrderSummaryType) do
            super
          end
        end

        private

        def instance_scope
          group_orders = ::Order.select(:id, :status).group_by(&:status)

          ::Order.statuses.keys.map do |key|
            OpenStruct.new({
                             summary_type: key,
                             orders_total: group_orders.try(:fetch, key, []).try(:size).to_i
                           })
          end
        end
      end
    end
  end
end

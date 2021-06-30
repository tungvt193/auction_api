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
          ::Order.select(:id, :status).group_by(&:status).map do |key, value|
            OpenStruct.new({
                             summary_type: key,
                             orders_total: value.size
                           })
          end
        end
      end
    end
  end
end

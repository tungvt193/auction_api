module Types
  module Root
    # noinspection ALL
    module Mobile
      module QueryCombiner
        extend ActiveSupport::Concern

        # CRUD
        included do
          field :v1MobileRateList, ::Connections::RateConnection,
                function: ::Resolvers::Mobile::Rates::List, null: true, connection: true
          field :v1MobileRate, resolver: ::Resolvers::Mobile::Rates::Show
        end
      end
    end
  end
end

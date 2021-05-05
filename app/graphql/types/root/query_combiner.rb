module Types
  module Root
    # noinspection ALL
    module QueryCombiner
      extend ActiveSupport::Concern

      # CRUD
      included do
        include Types::Root::Admin::QueryCombiner
        include Types::Root::Common::QueryCombiner
        include Types::Root::Mobile::QueryCombiner
        include Types::Root::Web::QueryCombiner
      end
    end
  end
end

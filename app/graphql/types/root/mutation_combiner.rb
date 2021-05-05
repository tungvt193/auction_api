module Types
  module Root
    # noinspection ALL
    module MutationCombiner
      extend ActiveSupport::Concern

      # CRUD
      included do
        include Types::Root::Admin::MutationCombiner
        include Types::Root::Common::MutationCombiner
        include Types::Root::Mobile::MutationCombiner
        include Types::Root::Web::MutationCombiner
      end
    end
  end
end

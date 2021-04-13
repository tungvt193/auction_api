module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    def resolve(id:)
      _, id = GraphQL::Schema::UniqueWithinType.decode(id)

      collection.find(id)
    end

    def current_user
      context.fetch(:current_user)
    end

    private

    def collection
      Kernel.const_get(model)
    end

    def model
      self.class.type.of_type.name.demodulize.split('Type').first
    end
  end
end

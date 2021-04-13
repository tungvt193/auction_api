class AuctionApiSchema < GraphQL::Schema
  max_depth 10
  max_complexity 300
  default_max_page_size 20

  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Analysis::AST
  use BatchLoader::GraphQL
  use GraphQL::Guard.new(
    policy_object: GraphqlPolicy,
    not_authorized: ->(type, field) { GraphQL::ExecutionError.new("Not authorized to access #{type}.#{field}") }
  )

  # Object Resolution
  def self.resolve_type(_type, _obj, _ctx)
    # TODO: Implement this function
    # to return the correct type for `obj`
    type_class = "::Types::#{object.class}Type".safe_constantize
    raise ArgumentError, "Cannot resolve type for class #{object.class.name}" if type_class.blank?

    type_class
  end

  # Return a string UUID for `object`
  def self.id_from_object(object, type_definition, _)
    # Here's a simple implementation which:
    # - joins the type name & object.id
    # - encodes it with base64:
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.try(:id))
  end

  # Given a string UUID, find the object
  def self.object_from_id(id, _)
    # For example, to decode the UUIDs generated above:
    _, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    #
    # Then, based on `type_name` and `id`
    # find an object in your application
    # ...

    item_id
  end

  graphql_definition
end

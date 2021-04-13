class Types::BaseNode < Types::BaseObject
  implements GraphQL::Relay::Node.interface
  implements ::Interfaces::RecordInterface

  global_id_field :id
  field_class Types::BaseField

  def self.field(*args, camelize: false, **kwargs, &block)
    super
  end
end

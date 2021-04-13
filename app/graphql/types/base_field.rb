module Types
  class BaseField < GraphQL::Schema::Field
    argument_class Types::BaseArgument

    def initialize(*args, default_value: nil, **kwargs, &block)
      super(*args, **kwargs, &block)

      extension(::Extentions::DefaultValue, default_value: default_value) unless default_value.nil?
    end
  end
end

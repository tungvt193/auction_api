module Types
  class GraphqlIdType < Types::BaseScalar
    description 'EncryptId'

    class << self
      def coerce_result(value, context)
        return if value.blank?

        cryptor.encode(context.try(:parent_type).to_s, value)
      end

      private

      def cryptor
        ::GraphQL::Schema::UniqueWithinType
      end
    end
  end
end

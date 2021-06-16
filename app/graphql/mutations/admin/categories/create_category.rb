module Mutations
  module Admin
    module Categories
      class CreateCategory < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::CategoryType, null: false

        def resolve(args)
          super

          resource = collection.new

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters)
            resource.assign_attributes(attributes)

            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(:name, :status)
        end
      end
    end
  end
end

module Mutations
  module Admin
    module Users
      class ChangePasswordUser < BaseMutation
        argument :id, ID, required: true
        argument :attribute, Types::AttributeType, required: true
        field :data, Types::UserType, null: false

        def resolve(args)
          super

          ApplicationRecord.transaction do
            resource = object_from_id(args[:id])

            raise GraphQL::ExecutionError, 'Confirmed Password is incorrect!' if is_unconfirmed_password

            ApplicationRecord.transaction do
              resource.password = normalize_parameters[:password]
              resource.save!
            end
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(:password, :confirmed_password)
        end

        def is_unconfirmed_password
          normalize_parameters[:password] != normalize_parameters[:confirmed_password]
        end

        def collection
          ::User
        end
      end
    end
  end
end

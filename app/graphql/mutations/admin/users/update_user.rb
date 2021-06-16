module Mutations
  module Admin
    module Users
      class UpdateUser < BaseMutation
        argument :id, ID, required: true
        argument :attribute, Types::AttributeType, required: true
        argument :avatar, Types::FileType, required: false

        field :data, ::Types::UserType, null: false

        def resolve(args)
          super

          resource = object_from_id(args[:id])
          attributes = decode_attributes(normalize_parameters)

          ApplicationRecord.transaction do
            resource.assign_attributes(attributes)
            resource.avatar = params[:avatar] if params[:avatar].present?

            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(:first_name, :last_name, :email, :gender, :province_id,
                        :district_id, :ward_id, :address, :birthday, :tel)
        end
      end
    end
  end
end

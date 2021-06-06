module Mutations
  module Common
    module Users
      class UpdateProfile < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        argument :avatar, Types::FileType, required: false

        field :data, ::Types::UserType, null: false

        def resolve(args)
          super
          attributes = decode_attributes(normalize_parameters)

          ApplicationRecord.transaction do
            current_user.assign_attributes(attributes)
            current_user.avatar = params[:avatar] if params[:avatar].present?

            current_user.save!
          end

          { data: current_user }
        end

        private

        def normalize_parameters
          params.permit(:first_name, :last_name, :email, :gender, :province_id,
                        :district_id, :ward_id, :address, :birthday, :tel)
        end
      end
    end
  end
end

module Mutations
  module Admin
    module Users
      class CreateUser < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        argument :avatar, Types::FileType, required: false

        field :data, ::Types::UserType, null: false

        def resolve(args)
          super

          resource = collection.new
          attributes = decode_attributes(normalize_parameters)

          ApplicationRecord.transaction do
            resource.assign_attributes(attributes.merge({
                                                          creator_id: current_user.try(:id)
                                                        }))

            resource.avatar = params[:avatar] if params[:avatar].present?
            resource.password = ENV['DEFAULT_PASSWORD']

            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(:phone, :first_name, :last_name, :email, :gender, :province_id,
                                            :district_id, :ward_id, :address, :birthday, :tel, :referral_id, :status)
        end
      end
    end
  end
end

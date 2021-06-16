module Mutations
  module Web
    module Followers
      class CreateFollower < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::FollowerType, null: false

        def resolve(args)
          super

          resource = collection.new

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters).merge({
                                                                         user_id: current_user.try(:id)
                                                                       })

            resource.assign_attributes(attributes)
            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(:followable_id, :followable_type)
        end
      end
    end
  end
end

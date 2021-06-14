module Mutations
  module Common
    module Users
      class Follow < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::FollowerType, null: false

        def resolve(args)
          super

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters).merge({
                                                                         user_id: current_user.try(:id)
                                                                       })
            resource = object_from_followable(attributes)
            is_present?(resource) ? resource.destroy! : resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.permit(:followable_id, :followable_type)
        end

        def object_from_followable(attributes)
          ::Follower.where(attributes).first || ::Follower.new(attributes)
        end

        def is_present?(resource)
          resource.try(:id).present?
        end
      end
    end
  end
end

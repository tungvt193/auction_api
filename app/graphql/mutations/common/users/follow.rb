module Mutations
  module Common
    module Users
      class Follow < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::FollowerType, null: false

        def resolve(args)
          super
          attributes = decode_attributes(normalize_parameters).merge({
                                                                       user_id: current_user.try(:id)
                                                                     })
          resource = object_from_followable(attributes)
          is_present?(resource) ? resource.destroy! : resource.save!

          {
            data: ::OpenStruct.new({
                                     id: graphql_encode(::Follower, resource),
                                     followable_id: normalize_parameters[:followable_id],
                                     followable_type: normalize_parameters[:followable_type]
                                   })
          }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(:followable_id, :followable_type)
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

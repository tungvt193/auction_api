module Mutations
  module Common
    module SearchHistories
      class CreateSearchHistory < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::SearchHistoryType, null: false

        def resolve(args)
          super

          resource = collection.new({
                                      user_id: current_user.try(:id)
                                    })

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters)
            resource.assign_attributes(attributes)

            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(:keyword, :product_id)
        end
      end
    end
  end
end

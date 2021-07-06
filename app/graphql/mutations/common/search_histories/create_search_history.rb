module Mutations
  module Common
    module SearchHistories
      class CreateSearchHistory < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::SearchHistoryType, null: false

        def resolve(args)
          super

          resource = search_history_detector

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters)
            resource.assign_attributes(attributes)
            resource.try(:product).try(:append_keyword, normalize_parameters[:keyword])

            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(:keyword, :product_id)
        end

        def search_history_detector
          rs = collection.where(keyword: normalize_parameters[:keyword], user_id: current_user.try(:id)).first
          return rs if rs.present?

          collection.new({ user_id: current_user.try(:id) })
        end
      end
    end
  end
end

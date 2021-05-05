module Mutations
  module Mobile
    module Companies
      class DeleteCompany < BaseMutation
        argument :id, ID, required: true
        field :data, ::Types::CompanyType, null: false

        def resolve(args)
          super

          resource = object_from_id(args[:id])
          resource.destroy!

          { data: resource }
        end
      end
    end
  end
end

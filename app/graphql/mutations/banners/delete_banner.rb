module Mutations
  module Banners
    class DeleteBanner < BaseMutation
      argument :id, ID, required: true
      field :data, ::Types::BannerType, null: false

      def resolve(args)
        super

        resource = object_from_id(args[:id])
        resource.destroy!

        { data: resource }
      end
    end
  end
end

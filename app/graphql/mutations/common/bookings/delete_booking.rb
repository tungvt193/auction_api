module Mutations
  module Common
    module Bookings
      class DeleteBooking < BaseMutation
        argument :id, ID, required: true
        field :data, ::Types::BookingType, null: false

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

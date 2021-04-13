module Interfaces::RecordInterface
  include Types::BaseInterface

  graphql_name('RecordInterface')

  description 'Common Interface'

  field :id, ID, null: false
  field :created_at, Types::DateType, null: false, camelize: false
  field :updated_at, Types::DateType, null: false, camelize: false
end

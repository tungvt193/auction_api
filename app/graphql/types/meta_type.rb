module Types
  MetaType = GraphQL::ObjectType.define do
    name 'MetaType'

    field :total_count, types.Int
    field :total_pages, types.Int
    field :current_page, types.Int
    field :next_page, types.Int
    field :prev_page, types.Int
  end
end

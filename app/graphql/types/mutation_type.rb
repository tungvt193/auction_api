module Types
  class MutationType < Types::BaseObject
    include Types::Root::MutationCombiner
  end
end

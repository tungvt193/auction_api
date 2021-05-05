module Policies
  class CommonPolicy < BasePolicy
    class << self
      def query
        {}
      end

      def mutation
        {}
      end
    end
  end
end

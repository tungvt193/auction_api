module Policies
  class BasePolicy
    class << self
      def roles
        %w[agent sale admin user]
      end

      def has_permission?(current_user, resource)
        return false if current_user.blank?
        return true if current_user.super_admin?

        current_user.try(:scope).to_s.split(',').include?(resource)
      end
    end
  end
end

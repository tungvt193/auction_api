class GraphqlPolicy
  RULES = {
    'Query' => {
      '*': {
        guard: ->(_obj, _args, ctx) { roles.include?(ctx[:current_user].try(:role)) }
      },
    },
    'Mutation' => {
      '*': {
        guard: ->(_obj, _args, ctx) { roles.include?(ctx[:current_user].try(:role)) }
      },
      v1Signin: {
        guard: ->(_obj, _args, _ctx) { true }
      },
      v1ForgotPassword: {
        guard: ->(_obj, _args, _ctx) { true }
      },
      v1ResetPassword: {
        guard: ->(_obj, _args, _ctx) { true }
      }
    }
  }.freeze

  class << self
    def roles
      %w[super_admin admin user]
    end

    def guard(type, field)
      RULES.dig(type.name, field, :guard)
    end

    def not_authorized_handler(type, field)
      RULES.dig(type, field, :not_authorized) || RULES.dig(type, :'*', :not_authorized)
    end

    def has_permission?(current_user, resource)
      return false if current_user.blank?
      return true if current_user.super_admin?

      current_user.try(:scope).to_s.split(',').include?(resource)
    end
  end
end

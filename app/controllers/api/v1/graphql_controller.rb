module Api
  module V1
    class GraphqlController < BaseController
      # If accessing from outside this domain, nullify the session
      # This allows for outside API access while preventing CSRF attacks,
      # but you'll have to authenticate your user separately
      # protect_from_forgery with: :null_session

      def execute
        variables = prepare_variables(params[:variables])
        query = params[:query]
        operation_name = params[:operationName]
        context = {
          session: session,
          current_user: current_user
        }

        result = AuctionApiSchema.execute(
          query,
          variables: variables,
          context: context,
          operation_name: operation_name
        )

        render json: {
          data: result['data'],
          errors: result['errors'],
          message: 'Fetch Data Success!'
        }, status: :ok
      end

      private

      # Handle variables in form data, JSON body, or a blank value
      def prepare_variables(variables_param)
        case variables_param
        when String
          if variables_param.present?
            JSON.parse(variables_param) || {}
          else
            {}
          end
        when Hash
          variables_param
        when ActionController::Parameters
          variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
        when nil
          {}
        else
          raise ArgumentError, "Unexpected parameter: #{variables_param}"
        end
      end

      # gets current user from token stored in session

      # Handle form data, JSON body, or a blank value
      def ensure_hash(ambiguous_param)
        # ...code
      end
    end
  end
end

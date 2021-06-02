module Api
  module V1
    class GraphqlController < BaseController
      def execute
        query, variables, operation_name = formated_entity

        result = AuctionApiSchema.execute(
          query,
          variables: variables,
          context: {
            session: session,
            current_user: current_user
          },
          operation_name: operation_name
        )

        render json: {
          data: result['data'],
          errors: result['errors'],
          message: 'Fetch Data Success!'
        }, status: :ok
      end

      private

      def formated_entity
        query = params[:query]
        operation_name = params[:operationName]
        variables = prepare_variables(params[:variables])

        [query, variables, operation_name]
      end

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
          variables_param.to_unsafe_hash # GraphQLRuby will validate name and type of incoming variables.
        when nil
          {}
        else
          raise ArgumentError, "Unexpected parameter: #{variables_param}"
        end
      end

      def handle_error_in_development(exc)
        logger.error exc.message
        logger.error exc.backtrace.join("\n")

        render json: {
          errors: [{ message: exc.message, backtrace: exc.backtrace }],
          data: {}
        }, status: :internal_server_error
      end
    end
  end
end

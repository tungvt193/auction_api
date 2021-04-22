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
            current_user: current_user,
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
        if params[:operations].present?
          operation_json = JSON.parse(params[:operations])
          map_json = JSON.parse(params[:map])

          variables = operation_json['variables']
          query = operation_json['query']
          operation_name = operation_json['operationName']

          variable_keys = variables.keys

          map_json.keys.each do |file_k|
            variables['input']['file'] = params[file_k] if variable_keys.include?('file')
            variables['input']['files'].push(params[file_k]) if variable_keys.include?('files')
          end

          return [query, variables, operation_name]
        end

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

      def handle_error_in_development(e)
        logger.error e.message
        logger.error e.backtrace.join("\n")

        render json: {
          errors: [{ message: e.message, backtrace: e.backtrace }],
          data: {}
        }, status: 500
      end
    end
  end
end

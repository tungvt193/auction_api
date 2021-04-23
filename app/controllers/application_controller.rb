class ApplicationController < ActionController::API
  include IErrors
  include ExceptionHandler

  def api_error(error, status)
    logger.error error.message
    logger.error error.backtrace.join("\n")

    render json: {
      errors: [{
        message: error.message,
        extensions: {
          code: status,
          exception: {
            stacktrace: [
              error.backtrace
            ]
          }
        }
      }],
      message: error.message,
      data: nil
    }, status: :ok
  end
end

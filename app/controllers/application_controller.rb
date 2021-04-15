class ApplicationController < ActionController::API
  include IErrors
  include ExceptionHandler

  def api_error(e, status)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: {
      errors: [{
        message: e.message,
        extensions: {
        code: status,
          exception: {
            stacktrace: [
              e.backtrace
            ]
          }
        }
      }],
      message: e.message,
      data: nil
    }, status: 200
  end
end

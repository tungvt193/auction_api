class ApplicationController < ActionController::API
  include IErrors
  include ExceptionHandler

  def api_error(e, status)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: status
  end
end

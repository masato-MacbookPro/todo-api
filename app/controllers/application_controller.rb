class ApplicationController < ActionController::API
  rescue_from StandardError, with: :error500
  rescue_from ActiveRecord::RecordNotFound, with: :error_404
  rescue_from ActionController::RoutingError, with: :error_404

  private

  def error_404
    render json: { errors: { code: '404', message: 'ページが存在しません。' } }, status: :not_found
  end

  def error_500(error)
    render json: { errors: { code: '500', message: 'Internal Server Error' } }, status: :internal_server_error
  end
end

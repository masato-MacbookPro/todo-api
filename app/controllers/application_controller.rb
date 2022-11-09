class ApplicationController < ActionController::API
  rescue_from StandardError, with: :error500
  rescue_from ActiveRecord::RecordNotFound, with: :error404

  private

  def error404
    render json: { errors: { code: '404', message: 'IDに一致するデータが存在しません' } }, status: :not_found
  end

  def error500(error)
    render json: { errors: { code: '505', message: 'Internal Server Error' } }, status: :internal_server_error
  end
end

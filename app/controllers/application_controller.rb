class ApplicationController < ActionController::API
    include ExceptionHandler
    before_action :authorize_request
  
    private
  
    def authorize_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      begin
        @decoded = JsonWebToken.decode(header)
        @current_user = User.find(@decoded[:user_id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue ExceptionHandler::InvalidToken => e
        render json: { errors: e.message }, status: :unauthorized
      end
    end
  
    def current_user
      @current_user
    end
  end
module ExceptionHandler
    extend ActiveSupport::Concern
  
    class InvalidToken < StandardError; end
  
    included do
      rescue_from ExceptionHandler::InvalidToken, with: :invalid_token_request
  
      private
  
      def invalid_token_request(e)
        render json: { errors: e.message }, status: :unauthorized
      end
    end
  end
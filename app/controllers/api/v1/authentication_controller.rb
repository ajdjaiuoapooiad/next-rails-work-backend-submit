class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :login

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      render json: { token: token, user: { id: @user.id } }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def logout
    # クライアント側でトークンを破棄するため、サーバー側では特に処理は不要
    render json: { message: 'ログアウトしました' }, status: :ok
  end
end
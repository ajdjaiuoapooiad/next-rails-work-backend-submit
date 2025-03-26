Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "messages/index"
      get "messages/create"
      # ユーザー関連
      resources :users, only: [:index, :show, :create, :update, :destroy] do
        resources :profiles, only: [:create, :update, :show]
      end

      # 求人情報関連
      resources :jobs, only: [:index, :show, :create, :update, :destroy]

      # メッセージ関連
      resources :messages, only: [:index, :create]

      # 認証関連
      post '/login', to: 'authentication#login'
    end
  end
end

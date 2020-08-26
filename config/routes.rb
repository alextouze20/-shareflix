Rails.application.routes.draw do
  devise_for :users
  root to: 'platforms#index'

  get '/chatrooms/', to: 'chatroom#index'
  get '/construct/', to: 'platforms#construct'

  resources :platforms, only: [:index, :show] do
    resources :build, controller: 'platform_accounts/build', only: [:create]
  end

  resources :platform_accounts, only: [:show, :destroy, :edit, :update] do
    resources :build, controller: 'platform_accounts/build', only: [:show, :update]
  end

  resources :account_seats, only: [:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

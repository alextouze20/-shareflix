Rails.application.routes.draw do
  devise_for :users
  root to: 'platforms#index'

  resources :platforms, only: [:index, :show]
    resources :platform_accounts, only: [:show, :destroy, :edit, :update, :new, :create]
  get '/chatrooms/', to: 'chatroom#index'
  get '/construct/', to: 'platforms#construct'
  resources :platforms, only: [:index, :show] do
    resources :build, controller: 'platform_accounts/build', only: [:create]
  end
  resources :platform_accounts, only: [:show, :destroy, :edit, :update] do
    resources :build, controller: 'platform_accounts/build', only: [:show, :update]
  end

  resources :profiles, only: [:edit, :update, :show, :destroy] do
    resources :reviews, only: [ :new, :create ]
  end
  resources :reviews, only: [ :destroy]
end

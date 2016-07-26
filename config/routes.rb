Rails.application.routes.draw do

  resources :orders, only: [:index, :create]
  resources :menus, only: [:index]

  resources :products, only: [:index]
  get 'welcome/index'
  get 'welcome/dashboard'

  devise_for :users, :controllers => {:registrations => 'users/registrations',
                                      :omniauth_callbacks => "users/omniauth_callbacks"}

  authenticated :user, lambda { |user| user.admin? } do
    root 'admin/users#index', as: 'admin_root'
    namespace :admin do
      resources :orders, only: [:index]
      resources :users, only: [:index]
      resources :menus, only: [:index, :create]
      resources :api_keys, only: [:index, :create, :destroy]
    end
  end

  authenticated :user do
    root 'welcome#dashboard', as: 'authenticated_root'
  end

  unauthenticated do
    root 'welcome#index', as: 'root'
  end

  namespace :api do
    resources :orders, only: [:index]
  end
end

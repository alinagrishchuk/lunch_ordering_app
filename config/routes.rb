Rails.application.routes.draw do
  namespace :admin do
  get 'users/index'
  end

  resources :orders, only: [:index, :create]

  get 'menus/index'

  get 'welcome/index'
  get 'welcome/dashboard'

  devise_for :users, :controllers => {:registrations => 'users/registrations'}

  authenticated :user, lambda { |user| user.admin? } do
    root 'admin/users#index', as: 'admin_root'
    namespace :admin do

    end
  end

  authenticated :user do
    root 'welcome#dashboard', as: 'authenticated_root'
  end

  unauthenticated do
    root 'welcome#index', as: 'root'
  end

end

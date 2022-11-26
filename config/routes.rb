Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get, :post]
  resources :users, only: [:index]
  resources :groups, only: [:new, :index, :show, :create] do
    resources :items, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  authenticated :user do
    root to: 'groups#index'
  end

  devise_scope :user do
    root to: 'users#index', as: :splash_root
  end
end

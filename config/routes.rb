Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get, :post]
  resources :groups, only: [:new, :index, :show, :create] do
    resources :items, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "groups#index"
end

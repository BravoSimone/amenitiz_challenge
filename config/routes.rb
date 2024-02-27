Rails.application.routes.draw do
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'

  resources 'orders', only: [:index, :show, :create, :destroy]
  put 'orders/:id/add_product/:product_id', action: :add_product, controller: 'orders', as: :order_add_product

  resources 'products', only: [:index, :show, :create, :destroy, :update]
end

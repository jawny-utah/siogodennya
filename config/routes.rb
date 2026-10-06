Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "health", to: "health#show"

  if Rails.env.development?
    get "load_test/spike", to: "load_test#spike"
    get "load_test/flaky", to: "load_test#flaky"
  end

  # Defines the root path route ("/")
  root "pages#index"
  resources :posts, only: :show
  resources :products
  resources :purchases, only: :create
end

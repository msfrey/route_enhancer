Rails.application.routes.draw do
  get 'routes/index'
  get 'auth/index'
  get 'main/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "main#index"
  get "/auth", to: "auth#index"
  get "/routes", to: "routes#index"
end

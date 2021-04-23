Rails.application.routes.draw do
  resources :users, only: [:index, :create, :update]
  
  # /login to login controller
  post "/login", to: "users#login"
  get "/users/:id", to: "users#match"
end

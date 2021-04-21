Rails.application.routes.draw do
  resources :users
  
  # /login to login controller
  post "/login", to: "users#login"
end

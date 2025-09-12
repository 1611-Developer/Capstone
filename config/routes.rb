Rails.application.routes.draw do
  # Signup routes
  get  "/signup", to: "signup#new"
  post "/signup", to: "signup#create"

  # Login/logout routes
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # Static pages
  root   "static_pages#home"
  get    "/about",   to: "static_pages#about"
  get    "/help",    to: "static_pages#help"
  get    "/contact", to: "static_pages#contact"

  # Passwords resource
  resources :passwords, param: :token
  resources :sessions, only: [:new, :create, :destroy]
end


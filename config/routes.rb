Rails.application.routes.draw do
  get "profiles/show"
  # Signup routes
  get  "/signup", to: "signup#new"
  post "/signup", to: "signup#create"

  # Login/logout routes
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  # Static pages
  root   "static_pages#home"
  get    "/about",   to: "static_pages#about"
  get    "/help",    to: "static_pages#help"
  get    "/contact", to: "static_pages#contact"

  # Logged routes
  get "/dashboard", to: "dashboard#show", as: :dashboard

  # Resources gives you standard routes for all CRUD actions.
  resources :projects do
    member do
      get 'confirm_delete'
    end
  end

  get "/profile/:username", to: "profiles#show", as: :profile

  # Passwords resource
  resources :passwords, param: :token
end


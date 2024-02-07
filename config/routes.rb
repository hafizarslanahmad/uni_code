Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "user_index", to: "users#index"
  
  
  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"
  delete "logout", to: "sessions#destroy"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  resources :hecs
  resources :universities
  resources :students

  # Defines the root path route ("/")
   root "main#index"
end

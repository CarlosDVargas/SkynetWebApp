Rails.application.routes.draw do
  resources :operations
  resources :routes
  resources :countries
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'main/home', to: 'home#main', as: 'main_home'

  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end

Rails.application.routes.draw do
  resources :batches
  resources :products
  resources :operations
  resources :routes
  resources :countries
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'main/home', to: 'home#main', as: 'main_home'
  get 'main/about', to: 'home#about', as: 'main_about'

  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end

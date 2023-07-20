Rails.application.routes.draw do
  #get 'splash/index'
  devise_for :users
  resources :groups
  resources :expences
  resources :users
  resources :splash, only: [:index]
  root to: :splash, controller: :splash, action: :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

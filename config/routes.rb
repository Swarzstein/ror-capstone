Rails.application.routes.draw do
  devise_for :users
  #get 'splash/index'
  resources :splash, only: [:index]
  resources :groups do
    resources :expenses
  end
  root "splash#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

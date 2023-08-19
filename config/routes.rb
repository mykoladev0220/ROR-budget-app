Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "splash#index"
  resources :users, only: [:index, :show] do
    resources :groups, only: [:index, :new, :create, :destroy] do
      resources :expenses, only: [:index,:new, :create] 
    end
  end
end

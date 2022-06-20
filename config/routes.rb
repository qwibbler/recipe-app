Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :show, :create, :destroy, :new]
  resources :foods, only: [:index, :create, :destroy, :new]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'public_recipes', :to => 'recipes#public'
  # Defines the root path route ("/")
  root "foods#index"
end

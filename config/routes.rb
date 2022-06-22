Rails.application.routes.draw do
  devise_for :users

  resources :foods, only: [:index, :create, :destroy, :new]
  resources :recipes do
    resources :recipe_foods
  end
  get 'public_recipes', :to => 'recipes#public'

  root "foods#index"
end

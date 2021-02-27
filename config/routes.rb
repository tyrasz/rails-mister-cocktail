Rails.application.routes.draw do
  get 'cocktails/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  get "cocktails", to: "cocktails#index"
  get "cocktails/new", to: "cocktails#new"
  get "cocktails/:id", to: "cocktails#show", as: :cocktail

  post "cocktails", to: "cocktails#create"

  resources :cocktails do
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: [:destroy]
end

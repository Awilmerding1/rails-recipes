Rails.application.routes.draw do


  resources :users
  resources :ingredients
  # HTTP VERB 'route', to: 'controller#action'
  resources :recipes do
    resources :ingredients
  end

  root 'users#home'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: "sessions#fb_create"

  # get '/favorites', to: 'recipes#favorites', as: 'favorites'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

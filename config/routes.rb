Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/welcome', to: "welcome#show", as: :welcome
  get '/login', to: "sessions#new", as: :login
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: :logout
  get '/users/signup', to: "users#new", as: :new_user
  post '/users', to: "users#create"
  get '/users/:id', to: "users#show", as: :user
  get '/cars/new', to: "cars#new", as: :new_car
  get '/cars', to: "cars#index", as: :cars
  post '/cars', to: "cars#create"
  get '/cars/:id', to: "cars#show", as: :car
  delete '/cars/:id', to: "cars#delete", as: :delete_car
  
  get '/cars/:id/edit', to: 'cars#edit', as: :edit_car
  
  patch '/cars/:id', to: 'cars#update'
  get '/users/:id/edit', to: 'users#edit', as: :edit_user
  patch '/users/:id', to: 'users#update'
  get '/races/new', to: 'races#new', as: :new_race
  post '/races', to: 'races#create', as: :create_race
  get '/races/:id', to: 'races#show', as: :race

  get '/races/:id/results', to: 'races#results', as: :result

  get '/users/:id/history', to: 'users#history', as: :history

  get '/pinks/new', to: 'races#new_pink', as: :new_race_pink
  post '/pinks', to: 'races#create_pink', as: :create_race_pink
  get '/pinks/:id', to: 'races#show_pink', as: :race_pink

  get '/pinks/:id/results', to: 'races#results_pink', as: :result_pink

  

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :rides

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  get '/driver', to: 'users#finddriver'
  post '/signup', to: 'users#create'
end

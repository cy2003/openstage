Rails.application.routes.draw do
  resources :users
  resources :welcomes
  get '/', to: "welcomes#index", as: 'root'
  resources :performers
  resources :promoters
  resources :owners
  resources :time_slots
  resources :venues
  resources :sessions
  get '/login', to: "welcomes#login", as: "login"
  get '/logout', to: "sessions#destroy", as: 'logout'
  resources :time_slot_applications
end

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :performers
  resources :promoters
  resources :owners
  resources :time_slots
  resources :venues
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

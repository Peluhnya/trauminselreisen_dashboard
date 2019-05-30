Rails.application.routes.draw do
  devise_for :users
  resources :hotel_types
  resources :hotel_sites
  resources :sites
  resources :hotels
  root 'hotels#main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

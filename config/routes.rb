Rails.application.routes.draw do
  # root 'gyms#index'
  root 'users#show'

  resources :gyms

  devise_for :users
  resources :users

end

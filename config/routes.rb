Rails.application.routes.draw do
  resources :managers

  # root 'gyms#index'
  root 'welcome#index'

  resources :gyms

  devise_for :users
  resources :users

end

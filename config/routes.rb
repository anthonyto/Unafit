Rails.application.routes.draw do
  get 'welcome/index'

  resources :gyms

  devise_for :users
  resources :users

  root 'gyms#index'
end

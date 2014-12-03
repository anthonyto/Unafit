Rails.application.routes.draw do
  resources :gyms

  devise_for :users
  resources :users

  
end

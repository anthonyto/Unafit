Rails.application.routes.draw do
  devise_for :administrators
  resources :administrators

  # root 'gyms#index'
  root 'welcome#index'

  resources :gyms

end

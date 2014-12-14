Rails.application.routes.draw do
  # root 'gyms#index'
  root 'welcome#index'

  resources :gyms

end

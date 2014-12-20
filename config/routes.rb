Rails.application.routes.draw do
  # root 'gyms#index'
  root 'welcome#index'

  resources :gyms

  devise_for :users
  
  resources :users do 
    resources :gyms
  end

end

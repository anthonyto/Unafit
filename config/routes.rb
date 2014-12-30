Rails.application.routes.draw do
  get 'errors/file_not_found'

  get 'errors/unprocessable'

  get 'errors/internal_server_error'

  root 'welcome#index'

  resources :gyms do
    member do
      get 'check_in_client', to: 'gyms#check_in_client'
      get 'update_sessions_left', to: 'gyms#update_sessions_left'
    end
    resources :users, only: [:index, :show]
  end

  devise_for :users, :controllers => {:registrations => "my_devise/registrations"} do
    member do 
      get 'new_admin', to: 'my_devise/registrations#new_admin'
      post 'new_admin', to: 'my_devise/registrations#create_admin'
    end
  end
  
  resources :users do 
    member do 
      get 'edit_subscriptions'
      patch 'edit_subscriptions', to: 'users#update_subscriptions'
      get 'new_manager'
      post 'new_manager', to: 'users#create_manager'
      # get 'new_admin', to: 'registrations#new_admin'
      # post 'new_admin', to: 'registrations#create_admin'
    end
    resources :client_profiles
    resources :gyms
    resources :charges
  end
  

  # error handling
  match '/404', to: "errors#file_not_found", via: :all
  match '/422', to: "errors#unprocessable", via: :all
  match '/500', to: "errors#internal_server_error", via: :all
  
end

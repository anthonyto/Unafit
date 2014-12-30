Rails.application.routes.draw do
  get 'errors/file_not_found'

  get 'errors/unprocessable'

  get 'errors/internal_server_error'

  root 'welcome#index'

  resources :gyms do
    member do 
      get 'new_manager'
      post 'new_manager', to: 'gyms#create_manager'
    end
    resources :users, only: [:index, :show]
  end

  devise_for :users
  
  resources :users do 
    member do 
      get 'edit_subscriptions'
      patch 'edit_subscriptions', to: 'users#update_subscriptions'
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

Rails.application.routes.draw do

  # Error pages handling
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
    resources :pictures, only: [:index, :show]
  end

  devise_for :users, controllers: { registrations: "my_devise/registrations", invitations: "my_devise/invitations"}
 
  devise_scope :user do
    # get "/users/invitation/accept", :to => "devise/invitations#edit",   :as => 'accept_user_invitation'
    # put "/users/invitation", :to => "devise/invitations#update"
    
    get 'new_admin',   to: 'my_devise/invitations#new_admin'
    patch 'new_admin', to: 'my_devise/invitations#create_admin'
    post 'new_admin',  to: 'my_devise/invitations#create_admin'
    
    # patch 'edit_admin', to: 'my_devise/invitations#update_admin'
    # put 'edit_admin', to: 'my_devise/invitations#update_admin'
    
    get 'gyms/:id/new_manager',   to: 'my_devise/invitations#new_manager', as: 'new_manager'
    # patch 'gyms/gym_id/new_manager', to: 'my_devise/invitations#create_manager'
    post 'gyms/:id/new_manager',  to: 'my_devise/invitations#create_manager'
  end
 
  
  resources :users do 
    member do 
      get 'edit_subscriptions'
      patch 'edit_subscriptions', to: 'users#update_subscriptions'
    end
    resources :client_profiles
    resources :gyms do 
      resources :pictures
    end
    resources :charges
  end
  

  # error handling
  match '/404', to: "errors#file_not_found", via: :all
  match '/422', to: "errors#unprocessable", via: :all
  match '/500', to: "errors#internal_server_error", via: :all
  
end

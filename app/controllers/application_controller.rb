class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize_user
  
  
  def after_sign_in_path_for(user)
    user_path(current_user.id)
  end
    
  private 
  
  def authorize_user
    authorize current_user
  end
  
end

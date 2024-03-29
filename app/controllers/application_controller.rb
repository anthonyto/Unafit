class ApplicationController < ActionController::Base
  include Pundit
  respond_to :html, :js
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  
  before_action :find_location
  
  
  def after_sign_in_path_for(user)
    user_path(current_user.id)
  end

  def find_location
    @location = request.location
  end
  
end

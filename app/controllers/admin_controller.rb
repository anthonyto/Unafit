class AdminController < ApplicationController
  
  def new_admin
    @user = User.new(:role => "admin")
  end
  
  def create_admin
    @user = User.create!(user_params)
    redirect_to user_path(current_user.id)
  end
  
end

class ClientProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @client_profile = ClientProfile.new
  end
  
  def create 
    @client_profile = ClientProfile.new(client_profile_params)
    @client_profile.set_lat_lng
    @client_profile.save
    respond_with @user
  end
   
  private
  
    def client_profile_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :city, :state, :street, :zip)
    end
  
  
end

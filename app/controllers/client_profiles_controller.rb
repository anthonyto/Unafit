class ClientProfilesController < ApplicationController
  before_action :authenticate_user!
  
  respond_to :html
  
  def new
    @client_profile = current_user.build_client_profile
  end
  
  def create 
    @client_profile = current_user.build_client_profile(client_profile_params)
    @client_profile.set_lat_lng
    @client_profile.save
    respond_with(current_user)
  end
   
  private
  
    def client_profile_params
      params.require(:client_profile).permit(:first_name, :last_name, :email, :phone_number, :city, :state, :street, :zip)
    end
  
  
end

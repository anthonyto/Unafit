class UsersController < ApplicationController
  before_action :set_user, except: [:update_subscriptions]
  before_action :authenticate_user!
  before_filter :authorize_user

  def index
    @users = User.all
  end
  
  def show
    if current_user.admin?
      @gyms      = Gym.all
      @num_users = User.count
      render "show_admin"
    elsif current_user.manager?
      @gym      = current_user.managed_gym
      @gym_json = gym_to_hash(@gym)
      @users    = @gym.users
      render "show_manager"
    else
      # if user has not set up their client profile, make them.
      if current_user.client_profile.nil?
        redirect_to new_user_client_profile_path(current_user.id), notice: 'Please complete your profile before proceeding.' and return
      end
      # If the user is subscribed, send the gyms they are subscribed to
      if current_user.active_and_subscribed? 
        @subscriptions = current_user.subscriptions
      end
      render "show_client"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end
  
  def edit_subscriptions
    @subscribed_gyms = current_user.gyms
    @gyms            = Gym.near(current_user.client_profile.geocode, 25)
  end
  
  def update_subscriptions
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    redirect_to root, notice: 'User was successfully destroyed.'
  end

  private
  
    def authorize_user
      authorize current_user
    end
  
    def set_user
      @user = current_user
    end
    
    def gym_to_hash(gyms)
      hash = Gmaps4rails.build_markers(gyms) do |gym, marker|
        marker.lat gym.latitude
        marker.lng gym.longitude
      end
      return hash
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :gym_ids => [])
    end
    
end

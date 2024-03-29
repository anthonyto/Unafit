class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :check_in_client, :update_sessions_left, :destroy]
  # before_filter :authorize_user

  # why is this here again?
  respond_to :html

  def index
    if Rails.env.development? 
      # If Dev, just send all gyms. Whatever. 
      @gyms = Gym.all
      @center = [@gyms.first.latitude, @gyms.first.longitude]
    elsif !user_signed_in? || current_user.client_profile.nil?
      # if a user is not signed in and in prod, or inactive, use their IP to find nearby gyms
      @gyms = Gym.near(request.location, 25)
      @center = [request.location.latitude, request.location.longitude]
    else
      # send gyms within 25 miles of their address
      @gyms = Gym.near(current_user.client_profile.geocode, 50)
      @center = [@gyms.first.latitude, @gyms.first.longitude]
    end
    # This is all GMaps4Rails stuff
    @gyms_json = Gmaps4rails.build_markers(@gyms) do |gym, marker|
      marker.lat gym.latitude
      marker.lng gym.longitude
      marker.json({
        name: gym.name,
        street: gym.street,
        city: gym.city,
        state: gym.state,
        zip: gym.zip,
        id: gym.id
      })
      marker.infowindow render_to_string(partial: "layouts/infowindow", locals: { gym: gym })
    end
  end

  def show
    @pictures = @gym.pictures
    @gym_json = Gmaps4rails.build_markers(@gym) do |gym, marker|
      marker.lat gym.latitude
      marker.lng gym.longitude
      marker.json({
        name: gym.name,
        street: gym.street,
        city: gym.city,
        state: gym.state,
        zip: gym.zip
      })
    end
  end

  def new
    @gym  = Gym.new
  end

  def edit
  end

  def create
    @gym  = Gym.new(gym_params)
    
    if @gym.save
      redirect_to new_manager_path(@gym.id), notice: 'Gym was successfully created.'
    else
      render :new
    end
  end

  def update
    @gym.update(gym_params)
    respond_with(@gym)
  end
  
  # How can we enforce that a manager can only check in a client of their own? 
  def check_in_client
    @user = User.find(params[:user_id])
    decrement_session(@gym, @user)
    flash[:notice] = "#{@user.first_name} successfully checked in."
    redirect_to current_user
  end

  def destroy
    @gym.destroy
    respond_with(@gym)
  end

  private
  
    def authorize_user
      authorize current_user
    end
  
    def decrement_session(gym, user)
      sessions_left = user.subscriptions.where(gym_id: gym.id).first.sessions_left
      if !gym.users.find(user) || sessions_left.nil?
        # throw some error here
      else
        if sessions_left > 0 
          sessions = sessions_left - 1
          user.subscriptions.where(gym_id: gym.id).first.update(sessions_left: sessions)
        end
      end
    end
    
    def set_gym
      @gym = Gym.find(params[:id])
    end

    def gym_params
      params.require(:gym).permit(:name, :email, :phone_number, :city, :state, :street, :zip, :two_gym_passes, :three_gym_passes, :four_gym_passes, :status, :description, :link, :profile_image, :logo_image, :showers, :classes, :reservation_policy)
    end
    
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :role => 1)
    end
    
    def associate_gym_and_manager(manager)
      @gym.manager_id = manager.id
    end
end

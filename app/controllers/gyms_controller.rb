class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @gyms = Gym.all
    respond_with(@gyms)
  end

  def show
    # if @gym.manager_id.nil?
    #   render 'users/new_manager'
    # end
    # respond_with(@gym)
  end

  def new
    @gym  = Gym.new
  end
  
  def new_manager
    authorize current_user
    @user = User.new
  end
  
  def create_manager
    authorize current_user
    @user = User.new(user_params)
    @gym.associate_gym_and_manager(@gym)
    @user.save
    respond_with(@gym)
  end

  def edit
  end

  def create
    @gym  = Gym.new(gym_params)
    @gym.save
    respond_with(@gym)
  end

  def update
    @gym.update(gym_params)
    respond_with(@gym)
  end

  def destroy
    @gym.destroy
    respond_with(@gym)
  end

  private
    def set_gym
      @gym = Gym.find(params[:id])
    end

    def gym_params
      params.require(:gym).permit(:name, :email, :phone_number, :city, :state, :street, :lat, :lng, :two_gym_passes, :three_gym_passes, :four_gym_passes, :status, :description, :link, :profile_image, :logo_image, :showers, :classes, :reservation_policy)
    end
    
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :role => 1)
    end
    
    def associate_gym_and_manager(manager)
      @gym.manager_id = manager.id
    end
end

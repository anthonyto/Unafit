class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @gyms = Gym.all
    respond_with(@gyms)
  end

  def show
    respond_with(@gym)
  end

  def new
    @user = User.new
    @gym  = Gym.new

    respond_with(@gym)
  end

  def edit
  end

  def create
    @gym  = Gym.new(gym_params)
    @user = User.new(user_params)
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
end

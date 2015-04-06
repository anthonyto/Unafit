class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :edit_subscriptions, :destroy]
  before_action :authenticate_user!
  # before_filter :authorize_user

  def index
    if current_user.admin?
      @users = User.all
    else
      @gym   = Gym.find(params[:gym_id])
      @users = @gym.users
    end
  end
  
  def show
    if current_user.admin?
      @gyms = Gym.all
      @num_users = User.count
      render "show_admin"
    elsif current_user.manager?
      @gym   = Gym.where(user_id: current_user.id).first
      @gym_json  = gym_to_hash(@gym)
      @users = @gym.users
      render "show_manager"
    else
      # if user has not set up their client profile, make them.
      if current_user.client_profile.nil?
        redirect_to new_user_client_profile_path(current_user.id)
      else
        # If the user is subscribed, send the gyms they are subscribed to
        if current_user.active_and_subscribed? 
          @subscriptions = current_user.subscriptions
          @gyms          = current_user.gyms
        else 
          # if the user is inactive or unsubscribed, send gyms in their area
          @gyms = Gym.near(current_user.client_profile.geocode, 25)
        end
        @center = [@gyms.first.latitude, @gyms.first.longitude]
        @gyms_json = Gmaps4rails.build_markers(@gyms) do |gym, marker|
          marker.lat gym.latitude
          marker.lng gym.longitude
          marker.json({
            name: gym.name,
            street: gym.street,
            city: gym.city,
            state: gym.state,
            zip: gym.zip
          })
          marker.infowindow render_to_string(partial: "layouts/infowindow", locals: { gym: gym })
        end
        render "show_client"
      end
    end
  end

  # I don't think we need these
  # GET /users/new
  # def new
  #   @user = User.new
  # end

  # POST /users
  # POST /users.json
  # def create
  #   @user = User.new(user_params)
  #
  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: 'User was successfully created.' }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
  end
  
  # GET /users/1/edit_subscriptionss
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
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to root, notice: 'User was successfully destroyed.'
  end

  private
  
    def authorize_user
      authorize current_user
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      # @user = User.find(params[:id])
      @user = current_user
    end
    
    def gym_to_hash(gyms)
      hash = Gmaps4rails.build_markers(gyms) do |gym, marker|
        marker.lat gym.latitude
        marker.lng gym.longitude
      end
      return hash
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :gym_ids => [])
    end
    
end

class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pictures = Picture.all
    respond_with(@pictures)
  end

  def show
    respond_with(@picture)
  end

  def new
    @gym = Gym.find(current_user.gym.id)
    @picture = Picture.new
    respond_with(@picture)
  end

  def edit
  end

  def create
    gym = Gym.find(params[:gym_id])
    @picture = Gym.pictures.build(picture_params)
    @picture.save
    respond_with(@picture)
  end

  def update
    @picture.update(picture_params)
    respond_with(@picture)
  end

  def destroy
    @picture.destroy
    respond_with(@picture)
  end

  private
    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:file_name, :gym_id)
    end
end

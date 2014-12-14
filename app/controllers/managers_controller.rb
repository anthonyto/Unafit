class ManagersController < ApplicationController
  before_action :set_manager, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @managers = Manager.all
    respond_with(@managers)
  end

  def show
    respond_with(@manager)
  end

  def new
    @manager = Manager.new
    respond_with(@manager)
  end

  def edit
  end

  def create
    @manager = Manager.new(manager_params)
    @manager.save
    respond_with(@manager)
  end

  def update
    @manager.update(manager_params)
    respond_with(@manager)
  end

  def destroy
    @manager.destroy
    respond_with(@manager)
  end

  private
    def set_manager
      @manager = Manager.find(params[:id])
    end

    def manager_params
      params.require(:manager).permit(:gym_name)
    end
end

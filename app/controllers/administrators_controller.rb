class AdministratorsController < ApplicationController
  before_action :set_administrator, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @administrators = Administrator.all
    respond_with(@administrators)
  end

  def show
    respond_with(@administrator)
  end

  def new
    @administrator = Administrator.new
    respond_with(@administrator)
  end

  def edit
  end

  def create
    @administrator = Administrator.new(administrator_params)
    @administrator.save
    respond_with(@administrator)
  end

  def update
    @administrator.update(administrator_params)
    respond_with(@administrator)
  end

  def destroy
    @administrator.destroy
    respond_with(@administrator)
  end

  private
    def set_administrator
      @administrator = Administrator.find(params[:id])
    end

    def administrator_params
      params.require(:administrator).permit(:email, :first_name, :last_name)
    end
end

class CampersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [ :show, :edit, :update, :destroy ]

  def index
    @campers = current_user.campers
  end

  def new
    @user = current_user
    @camper = Camper.new
  end

  def create
    @camper = Camper.new(camper_params)
    @camper.user = current_user
    if @camper.save
      redirect_to camper_path(@camper)
    else
      render :new
    end
  end

  def show
    @camper = Camper.find(params[:id])
    @user = current_user if user_signed_in?
    @booking = BookingRequest.new
  end

  def edit
    @camper = Camper.find(params[:id])
  end

  def update
    @camper = Camper.find(params[:id])
    @user = @camper.user
    if @camper.update(camper_params)
      redirect_to user_campers_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @camper = Camper.find(params[:id])
    @user = @camper.user
    @camper.destroy
    redirect_to user_campers_path(@user)
  end

  private

  def camper_params
    params.require(:camper).permit(:model, :price, :description, :photo_url, :photo, :capacity, :gear, :fuel, :address)
  end
end

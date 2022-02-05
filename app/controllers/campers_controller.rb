class CampersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :show

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
  end

  private

  def camper_params
    params.require(:camper).permit(:model, :price, :description, :availability, :photo_url, :photo)
  end
end

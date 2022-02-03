class CampersController < ApplicationController
  def index
    @campers = Camper.all
  end

  def new
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

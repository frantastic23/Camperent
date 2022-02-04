class BookingRequestsController < ApplicationController
  def index
    @bookings = BookingRequest.all
  end

  def edit
  end

  def show
    @booking = BookingRequest.find(params[:id])
    @user = @booking.user
    @camper = @booking.camper
  end

  def create
    @user = current_user
    @camper = Camper.find(params[:camper_id])
    @booking = BookingRequest.new(booking_request_params)
  end

  private

  def booking_request_params
    params.require(:booking_request).permit(:date_from, :date_to, :cost)
  end
end

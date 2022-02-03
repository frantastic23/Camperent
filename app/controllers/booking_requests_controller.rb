class BookingRequestsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @bookings = Booking.new
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @user = User.find(params[:user_id])
    @booking.user = @user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:availability)
  end
end

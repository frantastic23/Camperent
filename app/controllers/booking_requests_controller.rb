class BookingRequestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @bookings = @user.booking_requests
  end

  def edit
  end

  def show
    @booking = BookingRequest.find(params[:id])
    @user = @booking.user
    @camper = @booking.camper
  end

  def confirm
    @user = current_user
    @camper = Camper.find(params[:camper_id])
    @booking = BookingRequest.new(booking_request_params)
    if @camper.available?(@booking.date_from, @booking.date_to)
      @booking.user = @user
      @booking.camper = @camper
      @booking.calculate_cost
    else
      @booking.errors.add(:base, "The camper is not available on the dates")
      render camper_path(@camper)
    end
  end

  def create
    @user = current_user
    @camper = Camper.find(params[:camper_id])
    @booking = BookingRequest.new(booking_request_params_create)
    @booking.user = @user
    @booking.camper = @camper
    @booking.calculate_cost

    if @booking.save
      redirect_to user_booking_requests_path(current_user)
    else
      @camper.errors.add(:base, " The camper is not available on the dates")
      redirect_to @camper
    end
  end

  protected

  def booking_request_params
    params.require(:booking_request).permit(:date_from, :date_to)
  end

  def booking_request_params_create
    params.require(:param).permit('date_from', 'date_to')
  end
  helper_method :booking_request_params
end

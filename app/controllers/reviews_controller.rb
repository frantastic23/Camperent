class ReviewsController < ApplicationController
  def new
    @camper = Camper.find(params[:camper_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @camper = Camper.find(params[:camper_id])
    @review.camper = @camper
    if @review.save
      redirect_to camper_path(@camper)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

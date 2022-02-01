class CampersController < ApplicationController
  def index
    @campers = Camper.all
  end

  def new
  end

  def create
  end

  def show
    @camper = Camper.find(params[:id])
  end
end

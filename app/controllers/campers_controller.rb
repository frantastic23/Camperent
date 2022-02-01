class CampersController < ApplicationController
  def index
    @campers = Camper.all
  end

  def new
    @camper = Camper.all
  end

  def create
  end

  def show
  end
end

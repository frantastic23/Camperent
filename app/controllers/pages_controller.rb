class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :home, raise: false
  def home
  end

  def campers
    if params[:dt].present? || params[:df].present? || params[:address].present?
      camps = Camper.search_by_addres(params[:address])
      @campers = camps.select {|camper| camper.available?(params[:df], params[:dt])}

    else
      @campers = Camper.all
    end
  end
end

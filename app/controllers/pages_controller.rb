class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :home, raise: false
  def home
  end

  def campers
    if params[:date_from].present? || params[:date_to].present? || params[:address].present?
      params[:address].present? ? camps = Camper.search_by_address(params[:address]) : camps = Camper.all
      @campers = camps.select {|camper| camper.available?(params[:date_from], params[:date_to])}
    else
      @campers = Camper.all
    end
  end
end

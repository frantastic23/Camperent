class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[home campers], raise: false
  def home
  end

  def campers
    @campers = Camper.all

    @markers = @campers.geocoded.map do |camper|
      {
        lat: camper.latitude,
        lng: camper.longitude,
        info_window: render_to_string(partial: "info_window", locals: { camper: camper })
      }
    end

    if params[:date_from].present? || params[:date_to].present? || params[:address].present?
      params[:address].present? ? camps = Camper.search_by_address(params[:address]) : camps = Camper.all
      @campers = camps.select {|camper| camper.available?(params[:date_from], params[:date_to])}
    else
      @campers = Camper.all
    end
    description(@campers)
  end

  private

  def description(items)
    items.map do |item|
      item.description = item.description[0, 150] if item.description.length > 150
    end
  end
end

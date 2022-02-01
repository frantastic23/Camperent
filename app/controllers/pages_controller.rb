class PagesController < ApplicationController
  def home
    @campers = Camper.all
  end
end

class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :home, raise: false
  def home
  end

  def campers
    @campers = Camper.all
    description(@campers)
  end

  private

  def description(items)
    items.map do |item|
      item.description = item.description[0, 150] if item.description.length > 150
    end
  end
end

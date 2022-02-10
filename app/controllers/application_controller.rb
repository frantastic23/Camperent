require "json"
require "open-uri"
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def search
    url = "https://countriesnow.space/api/v0.1/countries"
    cities_s = URI.open(url).read
    cities = JSON.parse(cities_s)
    @cit = []
    cities.data.each do |element|
      @cit << element.cities
    end
    @cit.flat
  end
end

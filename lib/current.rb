# #require_relative './key.rb'
# require 'pry'
# require 'json'
# require 'open-uri'
# require 'forecast_io'
# require_relative 'home'
require_relative '../config/environment'
# require_relative "../key.rb"


class Current

  ForecastIO.api_key = WEATHER_KEY
  
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
    @weather = {}
    forecast
  end

  def forecast 
    @weather = ForecastIO.forecast(@latitude, @longitude)
    binding.pry
  end

  
end
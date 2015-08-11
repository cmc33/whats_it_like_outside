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
    forecast
  end

  def forecast 
    binding.pry
    ForecastIO.forecast(@latitude, @longitude)
  end

  
end
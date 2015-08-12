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
    all_data = ForecastIO.forecast(@latitude, @longitude)
    @weather = all_data[:currently]
    puts @weather
    space(@weather)
  end

  def space(hash)
    hash.each do |x|
      binding.pry
    end 
      
  end

  def rain
    binding.pry
    @weather[- currently]
  end

  def wind
    
  end

  def temp
    
  end
  def overview
    rain
    wind
    temp
  end
  
end
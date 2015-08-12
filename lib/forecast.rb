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
    @all_data = {}
    forecast
  end


  def forecast 
    all_data = ForecastIO.forecast(@latitude, @longitude)
    @weather = all_data[:currently]
    #puts @weather
    space(@weather)
  end

  def space(hash)
    hash.keep_if {|key, value| key == "summary" || key == "precipProbability" || key == "temperature" || key == "humidity" || key == "windSpeed" || key == "cloudCover"}
      binding.pry
    
    puts "huh"
    

      
  end

  def rain
    binding.pry
    @weather[- currently]
  end

  
end
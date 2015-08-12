# #require_relative './key.rb'
# require 'pry'
# require 'json'
# require 'open-uri'
# require 'forecast_io'
# require_relative 'home'
require_relative '../config/environment'
# require_relative "../key.rb"


class Forecast

  ForecastIO.api_key = WEATHER_KEY
  
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
    @weather = {}
    @all_data = {}
    forecast_getter
  end


  def forecast_getter
    @all_data = ForecastIO.forecast(@latitude, @longitude)
    @summary = @all_data[:daily][:key]
    @weather = @all_data[:daily][:data]
    # space(@weather)
    display
    more_info?
  end

  # def space(hash)
  #   hash.keep_if {|key, value| key == "summary" || key == "precipProbability" || key == "precipType" || key == "temperature" || key == "humidity" || key == "windSpeed" || key == "cloudCover"}
  #   display
  # end

  def display
    puts @summary 
    @weather.each do |i|
    puts "\n"
    puts "Summary: #{i[:summary]}"
    puts "Chance of Precipitation: #{i[:precipProbability]}"
    puts "Type of Precipitation: #{i[:precipType]}"
    puts "Min Temperature: #{i[:temperatureMin]}"
    puts "Max Temperature: #{i[:temperatureMax]}"
    puts "Humidity: #{i[:humidity]}"
    puts "Windspeed #{i[:windSpeed]}"
    puts "Cloud Cover: #{i[:cloudCover]}"
    end
    more_info?
  end

  def more_info?
    puts "\n \n Sorry for being rude earlier. Do you want more info about tomorrow?"
    answer = gets.chomp
    data_dump if answer == 'yes'
    if answer == 'no'
      puts "\n \n I wasn't really sorry. I'd ask you to show yourself out, but I don't trust you to know how, so I'll call exit for you"
      exit
    end
  end

  def data_dump
    puts @all_data
    puts "\n \n What do you think you are? A fucking meteorologist? Have fun with this \n \n"
  end


  def ultimatum
    puts "\n \ nDo you want to start over again, or GTFO of my program? \n
    Type 'again' or 'exit' "
    answer = gets.chomp.downcase
    exit if answer == "exit"
    startover if answer == 'again'
  end

  def again
    again = Home.new
    again
  end

  def exit
    puts "\n \n Good riddance.\n\n"
    Kernel.exit
  end
  
end


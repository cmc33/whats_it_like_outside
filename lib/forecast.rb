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
    @now = Time.now
    @day = 86400
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
    counter = 0 
    @weather.each do |i|
    puts "#{(@now + (@day * counter)).mon} / #{(@now + (@day * counter)).mday}"
    puts "\n"
    puts "Summary: #{i[:summary]}"
    puts "Chance of Precipitation: #{i[:precipProbability]}"
    puts "Type of Precipitation: #{i[:precipType]}"
    puts "Min Temperature: #{i[:temperatureMin]}"
    puts "Max Temperature: #{i[:temperatureMax]}"
    puts "Humidity: #{i[:humidity]}"
    puts "Windspeed #{i[:windSpeed]}"
    puts "Cloud Cover: #{i[:cloudCover]}"
    puts "\n"
    counter += 1
    end
    more_info?
  end

  def data_dump
    puts "\n \n What do you think you are? A fucking meteorologist? Have fun with this \n \n"
    sleep(2)
    @all_data.each do |i| 
      sleep(0.1)
      if i.empty? 
        i.each do |key|
          key.each do
          sleep(0.1)
          puts key
        end
        end
      end
      puts i
    end
      #puts i sleep(0.1)}
    ultimatum
  end

  def data_dump
    puts @all_data
    puts "\n \n What do you think you are? A fucking meteorologist? Have fun with this \n \n"
    ultimatum
  end


  def ultimatum
    puts "\n \n Do you want to start over again, or GTFO of my program? \n
    Type 'again' or 'exit' "
    answer = gets.chomp.downcase
    exit if answer == "exit"
    startover if answer == 'again'
  end

  def startover
    startover = Home.new
    again
  end

  def exit
    puts "\n \n Good riddance.\n\n"
    Kernel.exit
  end
  
end


require_relative './key.rb'
require 'pry'
require 'json'
require 'open-uri'
require_relative "../key.rb"
require 'forecast_io'
require_relative 'current.rb'
require_relative '../config/environment'

class Home

ZIP_BASE_URL = "https://www.zipcodeapi.com/rest/<api_key>/info.json/<zip_code>/degrees"
  
  def initialize
    @latitude = nil
    @longitude = nil
    @zipcode = Integer
    @timespan = ""
    puts 'running'
    overview
  end

  def overview
    #put graphic
    puts "Welcome....you can do this and that"
    zip_input
  end

  def zip_input
    puts "What is your fucking 5-digit zipcode"
    @zipcode = gets.chomp
    zipcode_validation
  end

  def zipcode_validation
    if @zipcode == 5
      zip_api_call
      timespan_input
    else puts "You don't know your own zipcode? Jesus h. christ!"
      zip_input
    end
  end

  def timespan_input
    # prompt = rand(1..5)
    # case 
    # when prompt == 1
    #   puts "passive aggressive statement"
    # when prompt == 2
    #   puts "great"
    # end
      puts "Do you want the weather right now, or the forecast?"
      @timespan = gets.chomp.downcase.to_s
    end

    def timespan_validation
      if @timespan == 'now'
        current_creator(@latitude, @longitude)
      elsif @timespan == 'forecast'
        forecast_creator(@latitude, @longitude)
      else puts "Bla bla passive aggressive"
        timespan_input
      end
    end

    def zip_api_call
      #binding.pry
      geo_data = JSON.load(open("https://www.zipcodeapi.com/rest/#{ZIP_KEY}/info.json/#{@zipcode}/degrees"))
      @latitude = geo_data['lat']
      @longitude = geo_data['lng']
    end

    def current_creator(latitude, longitude)
      Current.new(latitude, longitude)
    end

    def forecast_creator(latitude, longitude)
      forecast = Forecast.new(latitude, longitude)
    end
end
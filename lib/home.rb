#require_relative './key.rb'
require 'pry'
require 'json'
require 'open-uri'
require_relative "../key.rb"
class Home
  # attr_reader :zip

 ZIP_BASE_URL = "https://www.zipcodeapi.com/rest/<api_key>/info.json/<zip_code>/degrees"

  def initialize
    
    @zipcode = Integer
    @timespan = ""
    puts 'running'
    overview
  end

  def overview
    #put graphic
    puts "Welcome... you can do this and that"
    zip_input
  end

  def zip_input
    puts "What is your fucking 5-digit zipcode"
    @zipcode = gets.chomp
    zipcode_validation
  end

  def zipcode_validation
    binding.pry
    if @zipcode.size == 5 
      timespan_input
    else puts "You don't know your zipcode. What a loser. You aren't going to go outside anyway. Let's try again."
      zip_input
    end
  end

  def timespan_input
    # prompt = rand(1..5)
    #   case 
    #   when prompt == 1
    #     puts "passive aggressive statement"
    #   when prompt == 2
    #     puts "something else"   
    #   end
    puts "Do you want the weather right now, or the forecast"
    @timespan = gets.chomp.downcase.to_s
    timespan_validation
  end

  def timespan_validation
    if @timespan == 'now' || @timespan == 'forecast'
        zip_api_call
    else puts "You don't know your zipcode. What a loser. You aren't going to go outside anyway. Let's try again."
      timespan_input
    end
  end

  def zip_api_call
    JSON.load(open("https://www.zipcodeapi.com/rest/#{ZIP_KEY}/info.json/#{@zip_code}/degrees"))
    #forecast or current class creator method
  end

  def current_creator(api_call)
    #11237_current = Current.new
  end

  def forecast_creator(api_call)
    #11237_forecast = forecast.new
  end






end


Home.new
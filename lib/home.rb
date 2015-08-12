# #require_relative './key.rb'
# require 'pry'
# require 'json'
# require 'open-uri'
# require_relative "../key.rb"
# require 'forecast_io'
# require_relative 'current.rb'
require_relative '../config/environment'

class Home

 # attr_reader :zip

ZIP_BASE_URL = "https://www.zipcodeapi.com/rest/<api_key>/info.json/<zipcode>/degrees"

 def initialize
   @latitude = nil
   @longitude = nil
   @zipcode = Integer
   @timespan = ""
   puts 'running'
   overview
 end

 def overview
  puts     "     _____________________ 
    /                     \\
    :       WHAT'S        :
   /          IT           \\
  /          LIKE           \\
  \\        OUTSIDE?         /                            
   \\                       /
   /                       \\
   \\________________________/
    | |  |  /      /  | |  |
    | |  |  /    /_ _ | |  |
    | |  |  /___   /  | |  |
    | |  |    /  /    | |  |
    | |  |    / /     | |  |
    | |  |   //       | |  |
    | |  |  /         | |  |


   "
   puts "\n\n Do you really think you're going to go outside today? You are such a neck-beard that you're looking up the weather on your fucking terminal..."
   zip_input
 end

 def zip_input
   puts "\n\n  Still, I'll humor you. What is your 5-digit zipcode"
   @zipcode = gets.chomp
   zipcode_validation
 end

 def zipcode_validation
   if @zipcode.size == 5
     zip_api_call 
     timespan_input
   else puts "\n\n You don't know your zipcode. What a loser. Let's try again."
     zip_input
   end
 end

 def timespan_input
   puts "\n\n Do you want the weather right now, or the forecast. \n It should be obvious, but type 'now' or type 'forecast'"
   @timespan = gets.chomp.downcase.to_s
   timespan_validation
 end

 def timespan_validation
   if  @timespan == 'now' 
    current_creator(@latitude, @longitude)  
   elsif @timespan == 'forecast'
    forecast_creator(@latitude, @longitude)  
   else puts #REWRITE You don't know your zipcode. What a loser. You aren't going to go outside anyway. Let's try again."
     timespan_input
   end
 end

 def zip_api_call
  geo_data = JSON.load(open("https://www.zipcodeapi.com/rest/#{ZIP_KEY}/info.json/#{@zipcode}/degrees"))
  @latitude = geo_data['lat']
  @longitude = geo_data['lng']
  
  #puts @latitude @longitude
 end

 def current_creator(latitude, longitude)
   Current.new(latitude, longitude)
   #11237_current = Current.new
 end

 def forecast_creator(latitude, longitude)
   forecast = Forecast.new(latitude, longitude)
 end




end



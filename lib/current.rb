require_relative '../config/environment'

class Current

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
    @weather = @all_data[:currently]
    space(@weather)
  end


  def more_info?
    puts "\n \n Sorry for being rude earlier. Do you want more info about today's weather?"
    answer = gets.chomp
    data_dump if answer == 'yes'
    if answer == 'no'
      puts "\n \n I wasn't really sorry. I'd ask you to show yourself out, but I don't trust you to know how, so I'll call exit for you"
      exit
    end
  end

  def space(hash)
    hash.keep_if {|key, value| key == "summary" || key == "precipProbability" || key == "temperature" || key == "humidity" || key == "windSpeed" || key == "cloudCover"}
    display
  end

  def display
    puts "\n\n"
    puts "Summary: #{@weather[:summary]}"
    puts "Chance of Rain: #{@weather[:precipProbability]}"
    puts "Temperature: #{@weather[:temperature]}"
    puts "Humidity: #{@weather[:humidity]}"
    puts "Windspeed #{@weather[:windSpeed]}"
    puts "Cloud Cover: #{@weather[:cloudCover]}"
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

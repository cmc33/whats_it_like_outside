require_relative '../config/environment'

class Current

  ForecastIO.api_key = WEATHER_KEY
  
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
    @weather = {}
    @all_data = {}
    forecast
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

  def forecast 
    all_data = ForecastIO.forecast(@latitude, @longitude)
    @weather = all_data[:currently]
    space(@weather)
  end

  def space(hash)
    hash.keep_if {|key, value| key == "summary" || key == "precipProbability" || key == "temperature" || key == "humidity" || key == "windSpeed" || key == "cloudCover"}
    puts hash
    more_info?
  end

  def rain
    binding.pry
    @weather[- currently]
    @all_data = ForecastIO.forecast(@latitude, @longitude)
    @weather = @all_data[:currently]
    puts @weather
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

  def exit
    puts "\n \n Good riddance.\n\n"
    Kernel.exit

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

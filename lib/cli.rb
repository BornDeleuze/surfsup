class CLI 

    def run
        system("clear")
        puts "Welcome to Surfs Up!"
        puts "Please pick a location to find weather data for that station:"
        Scraper.scrape_spots
        list_spots
        menu
    end

    def list_spots
        puts " "
        puts " "
        puts "---------------------------------------------------"
        puts " "
        Spots.all.each.with_index(1) do |spot, i|
            puts "#{i}. #{spot.place}"
        end
        puts "---------------------------------------------------"
    end

    def menu
        puts "Please select a location for specific weather data, it may take a moment to load the spots!"
        input = gets.chomp
        system("clear")
        if 
            !input.to_i.between?(1, Spots.all.count)
            puts "You should share your secret spot cuz we don't know that one!"
            list_spots
            menu
        else
            spot = Spots.all[input.to_i-1]
            get_weather_details(spot)
        end
    end

    def get_weather_details(spot)
        Scraper.scrape_spots_details(spot)
        puts " 
        ---------------------------------------------------
        "
        puts "Here's the latest local weather info for #{spot.place}!"
        Spots.spot_good?(spot)
        puts "Would you like to check a different location?"
        puts "1. Yes"
        puts "2. No"
        input = gets.chomp
        system("clear")
        if input.to_i == 1 || input == "Yes"
            list_spots
            menu
        elsif 
            input.to_i == 2 || input == "No"
            puts "Thanks for scoping the spots!"
            ascii_wave
        else
            puts "Woops, didn't catch that, don't be a kook!"
            get_weather_details(spot)
        end
    end
    
    def ascii_wave
        puts"
        _.====.._
        ,:._       ~-_
            `\        ~-_
              | _  _  |  `.
            ,/ /_)/ | |    ~-_
   -..__..-''  \_ \_\ `_      ~~--..__...----...
   
   "
    end


end
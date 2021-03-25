
class CLI 

    def run
        system("clear")
        puts "Welcome to Surfs Up!"
        puts "Please pick a location to find weather data for that station:"
        puts "It may take a minute to load the spots!"
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
        puts "Please select a location for specific weather data!"
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
        spot_good?(spot)
        puts weather_brief(spot)
        # binding.pry

        puts "Would you like to check a different location?
        1. Yes
        2. No"
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

    def weather_brief(spot)
        if  spot.significant_wave_height != nil
            puts "Wave height is #{spot.significant_wave_height}"
        end
        if  spot.dominant_wave_period != nil
            puts "Wave period is #{spot.dominant_wave_period}"
        end
        if  spot.mean_wave_direction != nil
            puts "Wave direction is #{spot.mean_wave_direction}"
        end
        if  spot.wind_direction != nil
            puts "Wind direction is #{spot.wind_direction}"
        end
        if  spot.wind_speed != nil
           puts "Wind speed is #{spot.wind_speed}"
        end
        if  spot.wind_gust != nil
           puts "Wind gust is #{spot.wind_gust}"
        end
        if  spot.water_temperature != nil
            puts "Water temp is #{spot.water_temperature}"
        end
        if  spot.air_temperature != nil
            puts "Air temp is #{spot.air_temperature}"
        end
    end

    def spot_good?(spot)
        if spot.significant_wave_height == nil || spot.dominant_wave_period == nil
            spot.status= "We've got no data on waves here, sorry!"
        else
            wave_height = spot.significant_wave_height.delete("^0-9").to_i
            period = spot.dominant_wave_period.delete("^0-9").to_i
            if wave_height > 80 || period > 20
                spot.status = "DUDE IT IS FIRING HERE! BE CAREFUL! NO KOOKS ALLOWED!"
            elsif wave_height > 30 || period > 12
                spot.status = "You could be shredding these! Looks like fun waves!"   
            elsif wave_height != nil
                spot.status = "bummer, doesn't seem ridable here."
            end
        end

        if spot.location == "GRAYS HARBOR" || spot.location == "CAPE ELIZABETH"
            if spot.mean_wave_direction.delete("^0-9").to_i > 275 && wave_height > 60
                puts "It might even be going off in the Straight!!!"
            end
        end

        puts " "
        puts spot.status
        puts " "
        # binding.pry
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
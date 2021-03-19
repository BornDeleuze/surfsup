class Spots

    attr_accessor :station_id, :location, :weather_array, :weather_hash, :status, :dominant_wave_period, :significant_wave_height, :mean_wave_direction

    @@all = []

    def initialize(station_id, location)
        @station_id = station_id
        @location = location
        @@all << self
        
    end

    def info_setter
        self.weather_hash.each do |key, value| 
            if value != nil
              good_key = key.downcase.tr(" ", "_")
              self.class.attr_accessor(good_key)
              self.send(("#{good_key}="), value)
            end
        end
    end

    def self.info_setter(spot)
        spot.info_setter
    end

    def spot_good?
        if self.significant_wave_height != nil && self.dominant_wave_period != nil
            @status= "We've got no data on waves here, sorry!"
            wave_height = self.significant_wave_height.delete("^0-9").to_i
            period = self.dominant_wave_period.delete("^0-9").to_i

            if wave_height > 80 || period > 20
                status = "DUDE IT IS FIRING HERE! BE CAREFUL! NO KOOKS ALLOWED!"
            elsif wave_height > 30 || period > 12
                status = "You could be shredding these! Looks like fun waves!"   
            elsif wave_height != nil
                status = "bummer, doesn't seem ridable here."
            end

            if self.location == "GRAYS HARBOR" || self.location == "CAPE ELIZABETH"
                if self.mean_wave_direction.delete("^0-9").to_i > 275 && wave_height > 60
                    puts "It might even be going off in the Straight!!!"
                end
            end

            puts " "
            puts status
            puts " "
        end
    end

    def self.spot_good?(spot)
        spot.spot_good?
    end

    def self.all
        @@all
    end

end
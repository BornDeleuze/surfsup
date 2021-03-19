class Spots

    attr_accessor :station_id, :location, :weather_array

    @@all = []

    def initialize(station_id, location)
        @station_id = station_id
        @location = location
        @@all << self
        
    end

    # def good?
        
    # end

    def self.all
        @@all
    end




end
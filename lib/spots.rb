class Spots

    attr_accessor :station_id, :location, :weather_array

    @@all = []

    def initialize(station_id, location)
        @station_id = station_id
        @location = location
        @@all << self
        
    end

    def self.weather_array=(array)
        @weather_array=array
    end
    # def good?

    #iterate through weather data hashes
    #select and save key value pairs of: Significant wave height, Dominant Wave Period, Mean Wave Direction
    #analyse swell height and period, declare if it's crappy, ok, or firing!
    #analyse mean wave direction, and declare if they should check out the Straights!

        # h.select("Significant Wave Height")
    # end

    def self.all
        @@all
    end

end
class Spots

    attr_accessor :station_id, :location, :wave_height, :wave_direction, :dominant_wave_period, :water_temp

    @@all = []

    def initialize(station_id, location)
        @station_id = station_id
        @location = location
        @@all << self
    end

    def self.all
        @@all
    end


end
class Spots 

    attr_accessor :station_id, :place, :status, :dominant_wave_period, :significant_wave_height, :mean_wave_direction, :wind_direction, :wind_gust, :air_temperature, :water_temperature, :wind_speed

    @@all = []

    def initialize(station_id, place, significant_wave_height=nil, dominant_wave_period=nil, mean_wave_direction=nil, wind_direction=nil, wind_gust=nil, air_temperature=nil, water_temperature=nil, wind_speed=nil, status=nil)
        @station_id = station_id
        @place = place
        @significant_wave_height = significant_wave_height
        @dominant_wave_period = dominant_wave_period
        @mean_wave_direction = mean_wave_direction
        @wind_direction = wind_direction
        @wind_gust = wind_gust
        @air_temperature = air_temperature
        @water_temperature = water_temperature
        @status = status
        @@all << self
        
    end

    def self.all
        @@all
    end

end
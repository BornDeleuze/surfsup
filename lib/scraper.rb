class Scraper 

    def self.scrape_spots
        html = open("http://www.surfline.com/buoy-report/washington_2137/")
        doc = Nokogiri::HTML(html)
        doc.css("div.buoy-summary-container-item").each do |station|
            if station.css("div.buoy-station-id.borderRB").text  == nil ||station.css("div.buoy-name.borderRB").text == "Buoy Name"
                
            else
            place = station.css("div.buoy-name.borderRB").text
            station_id = station.css("div.buoy-station-id.borderRB").text
            Spots.new(station_id, place)
            end
        end
    end

    RELATIVE_URL = "https://www.ndbc.noaa.gov/data/latest_obs/"

    def self.scrape_spots_details(spot)
        html = open(RELATIVE_URL+spot.station_id+".rss")
        doc = Nokogiri::HTML(html)
        a = []
        spot.weather_hash={}
        array = doc.css('description').children.text.split("\n        ")
        
        array.each do |string|
            h={}
            x=string.split(": ")
            spot.weather_hash[x[0]] = x[1]
            h[x[0]] = x[1]
            a << h
        end
        Spots.info_setter(spot)
        puts a
    end

end
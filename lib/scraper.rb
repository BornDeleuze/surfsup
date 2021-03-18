class Scraper


    def self.scrape_spots
        html = open("http://www.surfline.com/buoy-report/washington_2137/")
        doc = Nokogiri::HTML(html)
        doc.css("div.buoy-summary-container-item").each do |station|
            # binding.pry
            location = station.css("div.buoy-name.borderRB").text
            station_id = station.css("div.buoy-station-id.borderRB").text
            Spots.new(station_id, location)
        end
binding.pry
    end


###
RELATIVE_URL = "https://www.ndbc.noaa.gov/data/latest_obs/"

    def self.scrape_spots_details(station_id)
        html = open(RELATIVE_URL+station_id.rss)
        doc = Nokogiri::HTML(html)

        a = []
        array = doc.css('description').children.text.split("\n        ")
        
        array.each do |string|
            h={}
            x=string.split(": ")
            h[x[0]] = x[1]
            a << h

        end
    end
    

end


        # doc.css('description').each do |element|        
        #     element.content
            # binding.pry
            
        # end

        # element.children.text

        # array = []
        # doc.xpath('//description').each do |element|
            #   h = {}
            #   element.xpath('key | value').each do |child|
            #     h["#{child.title}"] = child.text.strip
            #   end  
            #   array << h
            # end  
        # puts array 


        # html = open("https://www.ndbc.noaa.gov/data/latest_obs/46211.rss")
        # doc = Document.new(html)
        # root = doc.root
        # binding.pry


# doc = Nokogiri::XML(xml)
# out = []
# doc.xpath('//products/product').each do |product|
#   h = {}
#   product.xpath('name | price | SKU').each do |child|
#     h["#{child.name}"] = child.text.strip
#   end
#   out << h
# end
        # station_id =
        # location = 
        # doc.css("span").each do |span|
        # end
        # doc.xpath("//pre/span/a/@href")
    

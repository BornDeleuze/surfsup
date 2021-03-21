Hello!

BRIEF

This app is a simple command line application that gathers a list of weather stations in the North Pacific and allows users to access weather information from those stations.

DESCRIPTION

When started, the application gathers a list of live weather stations from a list of stations hosted by surfline.com, and prompts users to choose from this list. Most of these stations are buoys, some nearshore and some offshore, while a few are land based weather stations. Currently these sites range from Southern Oregon to Alaska. Upon selection, the application gathers specific weather information from NOAA (National Oceanic and Atmospheric Administration), who maintains these stations and the websites that host it. Additionally, a brief synopsis of the weather, in regards to surfing, may be displayed if the station provides sufficient data around surfing conditions. Users may then choose different locations to view data, or exit the program. 

This application runs on ruby, scrapes websites with open-uri, and parses with nokogiri. 

ACKNOWLEDGEMENTS

The exit wave art is from https://ascii.co.uk/ 
The list of buoys is maintained by surfline.com
The weather stations are maintained by NOAA.gov

BACKGROUND 

This application was the first application I ever wrote, and was created as my first project at Flatiron School in the software development course.

THANKS!  
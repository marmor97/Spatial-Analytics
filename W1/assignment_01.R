# libraries
pacman::p_load(tidyverse, htmltools, leaflet, htmlwidgets)

# load data
places <- read_csv("data/RCFeature.csv")
glimpse(places)

# making a map variable
friend_in_need <- leaflet() %>% 
  addTiles() %>% 
  addMarkers(lng = places$Longitude, 
             lat = places$Latitude,
             label = htmlEscape(paste("Type:", places$FeatureType,
                                       "ID:", places$FeatureID,
                                       "Description:", places$Description)),
                                clusterOptions = markerClusterOptions(),
             labelOptions = labelOptions(textsize = "30px")) %>% 
  addMiniMap() %>% 
  addMeasure()

#showing map
friend_in_need

# saving html-file
saveWidget(friend_in_need, "ass_01_friend_in_need.html", selfcontained = TRUE)


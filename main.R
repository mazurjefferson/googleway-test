
#### Getting credentials ----
keyList <- rjson::fromJSON(file = ".passwords") 
mapskey <-  keyList$apis$maps_api

#### Testing search ----
searchString <- "cafe"
loacationCoord <- c(25.4319266,-49.2693861) ## CTBA, PR

dfPlaces <- googleway::google_places(search_string = searchString, 
                           location = loacationCoord,   
                           key = mapskey)

#### Exploring results
dfPlaces$results$formatted_address # Address
dfPlaces$results$geometry # geometry
dfPlaces$results$geometry$location$lat # latitude
dfPlaces$results$geometry$location$lng # latitude
dfPlaces$results$user_ratings_total # ratings total
dfPlaces$results$rating # ratings
dfPlaces$results$name # ratings

placesResults <-tibble::tibble(
  id = 1:length(dfPlaces$results$name),
  name = dfPlaces$results$name,
  adress = dfPlaces$results$formatted_address,
  totalRatings = dfPlaces$results$user_ratings_total,
  rating = dfPlaces$results$rating,
  lat = dfPlaces$results$geometry$location$lat,
  lng = dfPlaces$results$geometry$location$lng
  )

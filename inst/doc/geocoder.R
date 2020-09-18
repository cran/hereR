## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(hereR)
library(mapview)
mapviewOptions(fgb = FALSE)
address <- poi$city
geocoded <- hereR:::example$geocode
suggestions <- hereR:::example$autosuggest
reverse_geocoded <- hereR:::example$reverse_geocode

## ----print_addresses, eval=TRUE, echo=TRUE, out.width='100%'------------------
head(address, 3)

## ----geocode, eval=FALSE------------------------------------------------------
#  geocoded <- geocode(address)

## ----head_geocoded, eval=TRUE, echo=TRUE, out.width='100%'--------------------
head(geocoded, 3)

## ----join_geocoded, eval=FALSE, echo=TRUE, out.width='100%'-------------------
#  df <- data.frame(
#    company = c("Schweizerische Bundesbahnen SBB", "Bahnhof AG", "Deutsche Bahn AG"),
#    address = c("Wylerstrasse 123, 3000 Bern 65", "not_an_address", "Potsdamer Platz 2, 10785 Berlin"),
#    stringsAsFactors = FALSE
#  )
#  locs <- geocode(df$address)
#  geocoded_sfdf <- st_as_sf(data.frame(locs, df[locs$id, ]))

## ----map_geocoded, eval=FALSE, out.width='100%'-------------------------------
#  mapview(geocoded,
#          label = geocoded$address,
#          col.regions = "red",
#          map.types = c("Esri.WorldTopoMap"),
#          legend = FALSE,
#          homebutton = FALSE
#  )

## ----autocomplete, eval=FALSE-------------------------------------------------
#  suggestions <- autocomplete(address, results = 3)

## ----results_autocomplete, eval=TRUE, echo=TRUE, out.width='100%'-------------
results <- data.frame(
  input = address[suggestions$id],
  id = suggestions$id,
  rank = suggestions$rank,
  suggestion = suggestions$suggestion
)

## ----table_results, eval=TRUE, echo=FALSE, out.width='100%', fig.align='center', screenshot.force=FALSE----
knitr::kable(head(results), format = "html")

## ----reverse_geocode, eval=FALSE, echo=TRUE, out.width='100%'-----------------
#  reverse_geocoded <- reverse_geocode(poi = poi, results = 3)

## ----map_reverse_geocode, eval=FALSE, echo=TRUE, out.width='100%'-------------
#  m <-
#    mapview(poi, alpha.region = 0, col.region = "transparent",
#            label = poi$city, cex = 30, layer.name = "POIs",
#            map.types = c("Esri.WorldTopoMap"), homebutton = FALSE) +
#    mapview(reverse_geocoded, col.region = "red", alpha = 0,
#            label = reverse_geocoded$label, layer.name = "Adresses",
#            homebutton = FALSE)
#  m


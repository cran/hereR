## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(hereR)
library(data.table)
library(mapview)
addresses <- poi$city
geocoded <- hereR:::example$geocode
suggestions <- hereR:::example$autocomplete
rev_addresses <- hereR:::example$reverse_geocode_addresses
rev_landmarks <- hereR:::example$reverse_geocode_landmarks

## ----print_addresses, eval=TRUE, echo=TRUE, out.width='100%'-------------
head(addresses, 3)

## ----geocode, eval=FALSE-------------------------------------------------
#  geocoded <- geocode(addresses, autocomplete = FALSE)

## ----head_geocoded, eval=TRUE, echo=TRUE, out.width='100%'---------------
head(geocoded, 3)

## ----join_geocoded, eval=FALSE, echo=TRUE, out.width='100%'--------------
#  geocoded_sfdf <- st_as_sf(data.frame(geocoded, df[row.names(geocoded), ]))

## ----map_geocoded, eval=TRUE, out.width='100%'---------------------------
mapview(geocoded,
        label = geocoded$address,
        col.regions = "yellow",
        map.types = c("Esri.WorldTopoMap"),
        legend = FALSE,
        homebutton = FALSE
)

## ----autocomplete, eval=FALSE--------------------------------------------
#  suggestions <- autocomplete(addresses, results = 3)

## ----results_autocomplete, eval=TRUE, echo=TRUE, out.width='100%'--------
results <- data.table(
  input = addresses[suggestions$id],
  rank = suggestions$order,
  suggestion = suggestions$label
)

## ----table_results, eval=TRUE, echo=FALSE, out.width='100%', fig.align='center'----
knitr::kable(head(results), format = "html")

## ----reverse_geocode, eval=FALSE, echo=TRUE, out.width='100%'------------
#  rev_addresses <- reverse_geocode(poi = poi, results = 3, landmarks = FALSE)
#  rev_landmarks <- reverse_geocode(poi = poi, results = 3, landmarks = TRUE)

## ----map_reverse_geocode, eval=TRUE, echo=TRUE, out.width='100%'---------
m <-
  mapview(poi, alpha.region = 0, col.region = "transparent",
          label = poi$city, cex = 30, layer.name = "POIs",
          map.types = c("Esri.WorldTopoMap"), homebutton = FALSE) +
  mapview(rev_addresses, col.region = "yellow", alpha = 0,
          label = rev_addresses$label, layer.name = "Adresses",
          homebutton = FALSE) +
  mapview(rev_landmarks, col.region = "red", alpha = 0,
          label = rev_landmarks$name, layer.name = "Landmarks",
          homebutton = FALSE)
m


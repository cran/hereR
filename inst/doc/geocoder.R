## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(hereR)
library(mapview)
addresses <- poi$city
geocoded <- hereR:::example$geocode

## ----print_addresses, eval=TRUE, echo=TRUE, out.width='100%'-------------
head(addresses, 3)

## ----geocode, eval=FALSE-------------------------------------------------
#  geocoded <- geocode(addresses)

## ----head_geocoded, eval=TRUE, echo=TRUE, out.width='100%'---------------
head(geocoded, 3)

## ----map_geocoded, eval=TRUE, out.width='100%'---------------------------
mapview(geocoded,
        label = geocoded$address,
        col.regions = "yellow",
        map.types = c("Esri.WorldTopoMap"),
        legend = FALSE,
        homebutton = FALSE
)


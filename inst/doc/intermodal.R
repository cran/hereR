## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(hereR)
library(mapview)
mapviewOptions(
  vector.palette = colorRampPalette(
    c("#000004FF", "#420A68FF", "#932667FF", "#DD513AFF", "#FCA50AFF", "#FCFFA4FF")
  )
)
intermodal_routes <- hereR:::example$intermodal_route

origin <- poi[1:2, ]
destination <- poi[3:4, ]

## ----int_directions, eval=FALSE-----------------------------------------------
#  ## POIs for intermodal routes in Berlin (service is not yet available in Switzerland)
#  poi_berlin <- data.frame(
#    name = c("HERE Berlin", "Treptow", "Potsdam", "Tiergarten"),
#    lng = c(13.384944, 13.461215, 13.058351, 13.336490),
#    lat = c(52.531056, 52.493908, 52.403587, 52.514557)
#  ) %>%
#    st_as_sf(coords = c("lng", "lat")) %>%
#    st_set_crs(4326)
#  
#  # Request routes
#  intermodal_routes <- route(
#    origin = poi_berlin[1:2, ],
#    destination = poi_berlin[3:4, ]
#  )

## ----table_int_directions, eval=TRUE, echo=FALSE, out.width='100%', fig.align='center', screenshot.force=FALSE----
knitr::kable(head(as.data.frame(intermodal_routes)[, colnames(intermodal_routes) != "geometry"]), format = "html")

## ----map_int_routes, eval=TRUE, out.width='100%'------------------------------
mapview(intermodal_routes,
        zcol = "mode",
        lwd = intermodal_routes$duration/max(intermodal_routes$duration)*5,
        layer.name = "Intermodal route",
        map.types = c("Esri.WorldTopoMap"),
        homebutton = FALSE
)


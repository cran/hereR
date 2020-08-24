## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(hereR)
library(mapview)
mapviewOptions(
  fgb = FALSE,
  vector.palette = colorRampPalette(
    c("#000004FF", "#420A68FF", "#932667FF", "#DD513AFF", "#FCA50AFF", "#FCFFA4FF")
  )
)
intermodal_routes <- hereR:::example$intermodal_route

## ----int_directions, eval=FALSE-----------------------------------------------
#  # Request routes
#  intermodal_routes <- route(
#    origin = poi[1:3, ],
#    destination = poi[4:6, ]
#  )

## ----table_int_directions, eval=TRUE, echo=FALSE, out.width='100%', fig.align='center', screenshot.force=FALSE----
knitr::kable(head(as.data.frame(intermodal_routes)[, colnames(intermodal_routes) != "geometry"]), format = "html")

## ----map_int_routes, eval=FALSE, out.width='100%'-----------------------------
#  mapview(intermodal_routes,
#          zcol = "mode",
#          layer.name = "Intermodal route",
#          map.types = c("Esri.WorldTopoMap"),
#          homebutton = FALSE
#  )


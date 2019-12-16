## ---- include = FALSE----------------------------------------------------
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
routes <- hereR:::example$route
mat <- hereR:::example$route_matrix
iso <- hereR:::example$isoline

start <- poi[1:2, ]
destination <- poi[3:4, ]

## ----directions, eval=FALSE----------------------------------------------
#  start <- poi[1:2, ]
#  destination <- poi[3:4, ]
#  routes <- route(
#    start = start,
#    destination = destination
#  )

## ----map_routes, eval=TRUE, out.width='100%'-----------------------------
routes$label <- paste(start$city[routes$id],
                      destination$city[routes$id],
                      sep =  " - ")
mapview(routes,
        zcol = "label",
        lwd = routes$travelTime/max(routes$travelTime)*5,
        layer.name = "Route [from - to]",
        map.types = c("Esri.WorldTopoMap"),
        homebutton = FALSE
)

## ----matrix, eval=FALSE--------------------------------------------------
#  # From - to
#  mat <- route_matrix(
#    start = poi[1:2, ],
#    destination = poi[3:4, ]
#  )
#  
#  # Construct O-D matrix (all routes between the POIs)
#  mat <- route_matrix(
#    start = poi
#  )

## ----table_route_matrix, eval=TRUE, out.width='100%', echo=FALSE, screenshot.force=FALSE----
knitr::kable(head(mat, 10), format = "html")

## ----isoline, eval=FALSE-------------------------------------------------
#  iso <- isoline(
#    poi,
#    range = seq(5, 30, 5) * 60,
#    rangetype = "time",
#    type = "fastest",
#    mode = "car",
#    aggregate = TRUE,
#    traffic = FALSE
#  )

## ----map_isoline, eval=TRUE, out.width='100%'----------------------------
iso$minutes <- iso$range/60
mapview(iso,
        zcol = "minutes",
        layer.name = "Isoline [min]",
        alpha = 0,
        map.types = c("Esri.WorldTopoMap"),
        homebutton = FALSE
)


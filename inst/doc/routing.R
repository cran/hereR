## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(hereR)

if (requireNamespace("mapview", quietly = TRUE)) {
  mapview::mapviewOptions(
    fgb = FALSE,
    vector.palette = colorRampPalette(
      c("#000004FF", "#420A68FF", "#932667FF", "#DD513AFF", "#FCA50AFF", "#FCFFA4FF")
    )
  )
}

routes <- hereR:::example$route
mat <- hereR:::example$route_matrix
iso <- hereR:::example$isoline

origin <- poi[1:2, ]
destination <- poi[3:4, ]

## ----directions, eval=FALSE---------------------------------------------------
#  origin <- poi[1:2, ]
#  destination <- poi[3:4, ]
#  routes <- route(
#    origin = origin,
#    destination = destination
#  )

## ----table_directions, eval=TRUE, echo=FALSE, out.width='100%', fig.align='center', screenshot.force=FALSE----
knitr::kable(head(as.data.frame(routes)[, colnames(routes) != "geometry"]), format = "html")

## ----map_routes, eval=FALSE, out.width='100%'---------------------------------
#  routes$label <- paste(origin$city[routes$id],
#                        destination$city[routes$id],
#                        sep =  " - ")
#  
#  if (requireNamespace("mapview", quietly = TRUE)) {
#    mapview::mapview(routes,
#                     zcol = "label",
#                     layer.name = "Route [O-D]",
#                     map.types = c("Esri.WorldTopoMap"),
#                     homebutton = FALSE
#    )
#  }

## ----matrix, eval=FALSE-------------------------------------------------------
#  # From - to
#  mat <- route_matrix(
#    origin = poi[1:2, ],
#    destination = poi[3:4, ]
#  )
#  
#  # Construct O-D matrix (all routes between the POIs)
#  mat <- route_matrix(
#    origin = poi
#  )

## ----table_route_matrix, eval=TRUE, out.width='100%', echo=FALSE, screenshot.force=FALSE----
knitr::kable(head(mat, 10), format = "html")

## ----isoline, eval=FALSE------------------------------------------------------
#  iso <- isoline(
#    poi,
#    range = seq(5, 30, 5) * 60,
#    range_type = "time",
#    routing_mode = "fast",
#    transport_mode = "car",
#    aggregate = TRUE,
#    traffic = FALSE
#  )

## ----map_isoline, eval=FALSE, out.width='100%'--------------------------------
#  iso$minutes <- iso$range/60
#  
#  if (requireNamespace("mapview", quietly = TRUE)) {
#    mapview::mapview(iso,
#            zcol = "minutes",
#            layer.name = "Isoline [min]",
#            alpha = 0,
#            map.types = c("Esri.WorldTopoMap"),
#            homebutton = FALSE
#    )
#  }


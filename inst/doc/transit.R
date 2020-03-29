## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(hereR)
library(mapview)
library(sf)
mapviewOptions(
  vector.palette = colorRampPalette(
    c("#000004FF", "#420A68FF", "#932667FF", "#DD513AFF", "#FCA50AFF", "#FCFFA4FF")
  )
)
connection_section <- hereR:::example$connection_section
connection_summary <- hereR:::example$connection_summary
stations <- hereR:::example$station

## ----pt_connection_section, eval = FALSE--------------------------------------
#  connection_section <- connection(
#    origin = poi[3:4, ],
#    destination = poi[5:6, ],
#    summary = FALSE
#  )

## ----table_connection_section, eval=TRUE, echo=FALSE, out.width='100%', fig.align='center', screenshot.force=FALSE----
knitr::kable(head(as.data.frame(connection_section)[, colnames(connection_section) != "geometry"]), format = "html")

## ----pt_connection_section_map, eval=TRUE, out.width='100%'-------------------
mapview(connection_section,
        zcol = "mode",
        layer.name = "Transport mode",
        map.types = c("Esri.WorldTopoMap"),
        homebutton = FALSE
)

## ----pt_connection_summary, eval = FALSE--------------------------------------
#  connection_summary <- connection(
#    origin = poi[3:4, ],
#    destination = poi[5:6, ],
#    summary = TRUE
#  )

## ----table_connection_summary, eval=TRUE, echo=FALSE, out.width='100%', fig.align='center', screenshot.force=FALSE----
knitr::kable(head(as.data.frame(connection_summary)[, colnames(connection_summary) != "geometry"]), format = "html")

## ----stations, eval=FALSE-----------------------------------------------------
#  stations <- station(
#    poi = poi,
#    radius = 500,
#    results = 5
#  )

## ----stations_map, eval=FALSE, out.width='100%'-------------------------------
#  # NOTE: This code block is temporarily not evaluated due to an issue of the
#  # mapview package when plotting multiple SF layers with the new CRS structure of
#  # version 0.9-0 (see: https://github.com/r-spatial/mapview/issues/271).
#  buffer <-
#    poi %>%
#    st_transform(2056) %>%
#    st_buffer(500) %>%
#    st_transform(4326)
#  
#  m <-
#    mapview(poi, alpha.region = 1, col.region = "black",
#            label = poi$city, layer.name = "POIs",
#            map.types = c("Esri.WorldTopoMap"), homebutton = FALSE) +
#    mapview(stations, col.region = "yellow", alpha = 1,
#            label = stations$station, layer.name = "Stations",
#            homebutton = FALSE) +
#    mapview(buffer, col.region = "transparent", alpha.region = 0,
#            layer.name = "Buffer", homebutton = FALSE, legend = FALSE)
#  m


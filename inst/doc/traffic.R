## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(hereR)
library(mapview)
mapviewOptions(
  vector.palette = colorRampPalette(
    c("#FFD700", "#CA0020")
  )
)
flow <- hereR:::example$traffic_flow
incidents <- hereR:::example$traffic_incidents

## ----flow, eval=FALSE----------------------------------------------------
#  flow <- traffic(
#    aoi = aoi[aoi$code == "LI", ],
#    product = "flow",
#    from_dt = Sys.time() - (60*60*2),
#    to_dt = Sys.time()
#  )

## ----map_flow, eval=TRUE, out.width='100%'-------------------------------
flow <- flow[order(flow$JF), ]
mapview(flow,
        zcol = "JF",
        lwd = flow$JF*2,
        layer.name = "Jam factor",
        map.types = c("Esri.WorldTopoMap"),
        homebutton = FALSE
)

## ----incidents, eval=FALSE-----------------------------------------------
#  incidents <- traffic(
#    aoi = aoi[aoi$code == "LI", ],
#    product = "incidents",
#    from_dt = Sys.time()-60*60*1.5,
#    local_time = FALSE
#  )

## ----map_incidents, eval=TRUE, out.width='100%'--------------------------
mapview(incidents,
        zcol = "type",
        layer.name = "Incident type",
        map.types = c("Esri.WorldTopoMap"),
        homebutton = FALSE
)


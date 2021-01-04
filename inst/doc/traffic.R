## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(hereR)

if (requireNamespace("mapview", quietly = TRUE)) {
  mapview::mapviewOptions(
    fgb = FALSE,
    vector.palette = colorRampPalette(c("#FFD700", "#CA0020"))
  )
}

flows <- hereR:::example$flow
incidents <- hereR:::example$incident

## ----flow, eval=FALSE---------------------------------------------------------
#  flows <- flow(
#    aoi = aoi[aoi$code == "LI", ]
#  )

## ----map_flow, eval=FALSE, out.width='100%'-----------------------------------
#  flows <- flows[order(flows$JF), ]
#  rownames(flows) <- NULL
#  
#  if (requireNamespace("mapview", quietly = TRUE)) {
#    mapview::mapview(flows,
#                     zcol = "JF",
#                     lwd = round(flows$JF*2),
#                     layer.name = "Jam factor",
#                     map.types = c("Esri.WorldTopoMap"),
#                     homebutton = FALSE
#    )
#  }

## ----incidents, eval=FALSE----------------------------------------------------
#  incidents <- incident(
#    aoi = aoi[aoi$code == "LI", ],
#    from = Sys.time()-60*60
#  )

## ----map_incidents, eval=FALSE, out.width='100%'------------------------------
#  if (requireNamespace("mapview", quietly = TRUE)) {
#    mapview::mapview(incidents,
#                     zcol = "type",
#                     layer.name = "Incident type",
#                     map.types = c("Esri.WorldTopoMap"),
#                     homebutton = FALSE
#    )
#  }


## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(hereR)
library(mapview)
library(ggplot2)
mapviewOptions(
  fgb = FALSE,
  vector.palette = colorRampPalette(
    c("#0571B0", "#92C5DE", "#F7F7F7","#F4A582", "#CA0020")
  )
)
observation <- hereR:::example$weather_observation
forecast <- hereR:::example$weather_forecast_hourly
astronomy <- hereR:::example$weather_forecast_astronomy
alerts <- hereR:::example$weather_alerts

## ----observations, eval = FALSE-----------------------------------------------
#  observation <- weather(
#    poi = poi,
#    product = "observation"
#  )

## ----table_obs, eval=TRUE, fig.align='center', out.width='100%', echo=FALSE, screenshot.force=FALSE----
cols <- c("station", "distance", "description",
          "temperature", "humidity",
          "windSpeed", "windDirection")
knitr::kable(as.data.frame(observation)[, cols], format = "html")

## ----map_obs, eval=FALSE, out.width='100%'------------------------------------
#  m <-
#    mapview(observation,
#            zcol = "temperature",
#            cex = observation$humidity/4,
#            layer.name = "Observation",
#            map.types = c("Esri.WorldTopoMap"),
#            homebutton = FALSE
#    ) +
#    mapview(poi,
#            zcol = "city",
#            cex = 1,
#            col.region = "black",
#            legend = FALSE,
#            homebutton = FALSE
#    )
#  m

## ----forecast, eval = FALSE---------------------------------------------------
#  forecast <- weather(
#    poi = poi,
#    product = "forecast_hourly"
#  )

## ----plots_forecast, eval=TRUE, out.width='100%'------------------------------
g <- lapply(1:nrow(forecast), function(x) {
  fc <- data.frame(
    dt = as.POSIXct(forecast$forecast[[x]]$utcTime, format = "%Y-%m-%dT%H:%M:%OS", tz = "UTC"),
    te = as.numeric(forecast$forecast[[x]]$temperature),
    rh = as.numeric(forecast$forecast[[x]]$humidity)
  )
  ggplot(fc, aes(x = dt)) + 
    geom_line(aes(y = te, colour = "Temperature")) +
    geom_line(aes(y = rh/5, colour = "Humidity")) +
    scale_y_continuous(sec.axis = sec_axis(~.*5, name = "Relative humidity [%]")) + 
    scale_colour_manual(values = c("blue", "red")) +
    labs(y = "Air temperature [°C]", x = "", colour = "") +
    ggtitle(forecast$station[x]) +
    theme_minimal() +
    theme(legend.position="bottom", panel.background = element_rect(color = NA))
})

## ----map_forecast, eval=FALSE, out.width='100%'-------------------------------
#  m <-
#    mapview(forecast,
#            color = "black",
#            col.region = "yellow",
#            layer.name = "Forecast",
#            zcol = "station",
#            map.types = c("Esri.WorldTopoMap"),
#            homebutton = FALSE,
#            legend = FALSE,
#            popup = leafpop::popupGraph(g)
#    ) +
#    mapview(poi,
#            zcol = "city",
#            cex = 1,
#            col.region = "black",
#            legend = FALSE,
#            homebutton = FALSE
#    )
#  m

## ----astronomy, eval = FALSE--------------------------------------------------
#  astronomy <- weather(
#    poi = poi,
#    product = "forecast_astronomy"
#  )

## ----table_ast, eval=TRUE, fig.align='center', out.width='100%', echo=FALSE, screenshot.force=FALSE----
ast <- astronomy$astronomy[[1]]
ast$phase <- ast$moonPhaseDesc
cols <- c("date", "sunrise", "sunset", "moonrise", "moonset", "phase")
knitr::kable(ast[, cols], format = "html", )

## ----alerts, eval = FALSE-----------------------------------------------------
#  alerts <- weather(
#    poi = poi,
#    product = "alerts"
#  )


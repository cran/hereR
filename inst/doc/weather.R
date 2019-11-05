## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(hereR)
library(mapview)
library(ggplot2)
mapviewOptions(
  vector.palette = colorRampPalette(
    c("#0571B0", "#92C5DE", "#F7F7F7","#F4A582", "#CA0020")
  )
)
observation <- hereR:::example$weather_observation
forecast <- hereR:::example$weather_forecast_hourly
astronomy <- hereR:::example$weather_forecast_astronomy
alerts <- hereR:::example$weather_alerts

## ----observations, eval = FALSE------------------------------------------
#  observation <- weather(
#    poi = poi,
#    product = "observation"
#  )

## ----table_obs, eval=TRUE, fig.align='center', out.width='100%', echo=FALSE----
cols <- c("station", "distance", "description",
          "temperature", "humidity",
          "windSpeed", "windDirection")
knitr::kable(as.data.frame(observation)[, cols], format = "html")

## ----map_obs, eval=TRUE, out.width='100%'--------------------------------
mapview(observation,
        zcol = "temperature",
        cex = observation$humidity/4,
        layer.name = "Observation",
        map.types = c("Esri.WorldTopoMap"),
        homebutton = FALSE
)

## ----forecast, eval = FALSE----------------------------------------------
#  forecast <- weather(
#    poi = poi,
#    product = "forecast_hourly"
#  )

## ----plots_forecast, eval=TRUE, out.width='100%'-------------------------
g <- lapply(1:nrow(forecast), function(x) {
  fc <- forecast$forecast[[x]]
  ggplot() + 
    geom_line(aes(x = seq(1, nrow(fc)), y = as.numeric(fc$temperature)),
              colour = 'red') +
    geom_line(aes(x = seq(1, nrow(fc)), y = as.numeric(fc$humidity)),
              colour = 'blue') +
    xlab("Time from now [h]") +
    ylab("Temperature [°C] / Humidity [%]") +
    ggtitle(forecast$city[x]) +
    theme_classic()
})

## ----map_forecast, eval=TRUE, out.width='100%'---------------------------
mapview(forecast,
        color = "black",
        col.region = "yellow",
        layer.name = "Forecast",
        zcol = "city",
        map.types = c("Esri.WorldTopoMap"),
        homebutton = FALSE,
        legend = FALSE,
        popup = leafpop::popupGraph(g)
)

## ----astronomy, eval = FALSE---------------------------------------------
#  astronomy <- weather(
#    poi = poi,
#    product = "forecast_astronomy"
#  )

## ----table_ast, eval=TRUE, fig.align='center', out.width='100%', echo=FALSE----
ast <- astronomy$astronomy[[1]]
ast$phase <- ast$moonPhaseDesc
cols <- c("date", "sunrise", "sunset", "moonrise", "moonset", "phase")
knitr::kable(ast[, cols], format = "html", )

## ----alerts, eval = FALSE------------------------------------------------
#  alerts <- weather(
#    poi = poi,
#    product = "alerts"
#  )


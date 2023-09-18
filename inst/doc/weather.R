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
      c("#0571B0", "#92C5DE", "#F7F7F7", "#F4A582", "#CA0020")
    )
  )
}

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
cols <- c(
  "id", "city", "distance", "daylight", "description", "sky_info", "sky_desc",
  "temperature", "temperature_desc", "comfort", "high_temperature",
  "low_temperature", "humidity", "dew_point", "precipitation_probability",
  "rain_fall", "wind_speed", "wind_direction", "wind_descr", "wind_descr_short",
  "uv_index", "uv_descr", "barometer_pressure", "barometer_trend"
)
knitr::kable(as.data.frame(observation)[, cols], format = "html")

## ----map_obs, eval=FALSE, out.width='100%'------------------------------------
#  if (requireNamespace("mapview", quietly = TRUE)) {
#    m <-
#      mapview::mapview(observation,
#        zcol = "temperature",
#        cex = observation$humidity / 10,
#        layer.name = "Observation",
#        map.types = c("Esri.WorldTopoMap"),
#        homebutton = FALSE
#      ) +
#      mapview::mapview(poi,
#        zcol = "city",
#        cex = 1,
#        col.region = "black",
#        legend = FALSE,
#        homebutton = FALSE
#      )
#    m
#  }

## ----forecast, eval = FALSE---------------------------------------------------
#  forecast <- weather(
#    poi = poi,
#    product = "forecast_hourly"
#  )

## ----plots_forecast, eval=TRUE, out.width='100%'------------------------------
if (requireNamespace("ggplot2", quietly = TRUE)) {
  g <- lapply(seq_len(nrow(forecast)), function(x) {
    df <- forecast$forecasts[[x]]
    ggplot2::ggplot(df, ggplot2::aes(x = time)) +
      ggplot2::geom_line(ggplot2::aes(y = temperature, color = "Temperature")) +
      ggplot2::geom_line(ggplot2::aes(y = humidity / 5, color = "Humidity")) +
      ggplot2::scale_y_continuous(sec.axis = ggplot2::sec_axis(~ . * 5, name = "Relative humidity [%]")) +
      ggplot2::scale_color_manual(values = c("blue", "red")) +
      ggplot2::labs(y = "Air temperature [°C]", x = "", colour = "") +
      ggplot2::ggtitle(forecast$city[x]) +
      ggplot2::theme_minimal() +
      ggplot2::theme(legend.position = "bottom", panel.background = ggplot2::element_rect(color = NA))
  })
}

## ----map_forecast, eval=FALSE, out.width='100%'-------------------------------
#  if (requireNamespace(c("ggplot2", "mapview", "leafpop"), quietly = TRUE)) {
#    m <-
#      mapview::mapview(forecast,
#        color = "black",
#        col.region = "yellow",
#        layer.name = "Weather station",
#        zcol = "city",
#        map.types = c("Esri.WorldTopoMap"),
#        homebutton = FALSE,
#        legend = FALSE,
#        popup = leafpop::popupGraph(g)
#      ) +
#      mapview::mapview(poi,
#        zcol = "city",
#        cex = 1,
#        col.region = "black",
#        layer.name = "POI",
#        legend = FALSE,
#        homebutton = FALSE
#      )
#    m
#  }

## ----astronomy, eval = FALSE--------------------------------------------------
#  astronomy <- weather(
#    poi = poi,
#    product = "forecast_astronomy"
#  )

## ----table_ast, eval=TRUE, fig.align='center', out.width='100%', echo=FALSE, screenshot.force=FALSE----
knitr::kable(astronomy$forecasts[[1]], format = "html")

## ----alerts, eval = FALSE-----------------------------------------------------
#  alerts <- weather(
#    poi = poi,
#    product = "alerts"
#  )


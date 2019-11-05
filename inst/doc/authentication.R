## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----set-----------------------------------------------------------------
library(hereR)

set_auth(
  app_id = "<YOUR APP ID>",
  app_code = "<YOUR APP CODE>"
)

## ----proxy---------------------------------------------------------------
set_proxy(
  proxy = "https://<YOUR-PROXY.NET>:<PORT>/",
  proxyuserpwd = "<USER>:<PASSWORD>"
)


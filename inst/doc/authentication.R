## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----set----------------------------------------------------------------------
library(hereR)
set_key("<YOUR API KEY>")

## ----set_verbose--------------------------------------------------------------
set_verbose(TRUE)

## ----proxy--------------------------------------------------------------------
set_proxy(
  proxy = "https://<YOUR-PROXY.NET>:<PORT>/",
  proxyuserpwd = "<USER>:<PASSWORD>"
)


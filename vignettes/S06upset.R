## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  echo = TRUE
)

## ----UpSetR, message = FALSE--------------------------------------------------
library(ggvenn)
library(UpSetR)

## ----data---------------------------------------------------------------------
data("fruits", package = "tidyViz")

## ----flist--------------------------------------------------------------------
flist <- with(fruits,
  list(
    Sucres = nom[Sucres > 20],
    Fibres = nom[Fibres > 2],
    Energie = nom[Energie > 50],
    Potassium = nom[Potassium > 100],
    Crus = nom[groupe == "crus"]
))

## ----fbin---------------------------------------------------------------------
fbin <- with(fruits,
  data.frame(
    Sucres = Sucres > 20,
    Fibres = Fibres > 2,
    Energie = Energie > 50,
    Potassium = Potassium > 100,
    Crus = groupe == "crus"
))

## ----venn, fig.height = 4, fig.width = 8--------------------------------------
ggvenn(flist, set_name_size = 5)


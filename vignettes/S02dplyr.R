## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- out.width="70%", fig.align='center'-------------------------------------
set.seed(7895)

hist(rnorm(10))

## ---- out.width="70%", fig.align='center'-------------------------------------
library(magrittr)
set.seed(7895)
rnorm(10) %>% hist()

## ----charger dplyr, message = FALSE-------------------------------------------
library(dplyr) # ou require(dplyr)

## ----charger tidyverse, eval = FALSE------------------------------------------
#  library(tidyverse)

## ----fruits-------------------------------------------------------------------
data("fruits", package = "tidyViz")

## ----fruitibble---------------------------------------------------------------
fruits

## ----mutate1------------------------------------------------------------------
fruits2 <- fruits %>% 
  mutate(Sucres_ratio = Sucres / 100)

head(fruits2[, "Sucres_ratio"])

## ----mutate_classic-----------------------------------------------------------
fruits2 <- fruits
fruits2$Sucres_ratio <- 
  fruits2$Sucres / 100
head(fruits2[, "Sucres_ratio"])

## ----select, eval = FALSE-----------------------------------------------------
#  fruits %>%
#    select(
#      Energie,
#      Sucres,
#      Lipides,
#      Proteines)

## ----select_classic, eval = FALSE---------------------------------------------
#  fruits[,
#    c(
#      "Energie",
#      "Sucres",
#      "Lipides",
#      "Proteines")]

## ----arrange------------------------------------------------------------------
fruits %>% 
  select(Energie, Sucres, Fibres) %>%
  arrange(desc(Fibres))

## ----arrange_classic----------------------------------------------------------
fruits[
  order(fruits$Fibres, decreasing = TRUE),
  c("Energie", "Sucres", "Fibres")]

## ----filter-------------------------------------------------------------------
fruits %>% 
  filter(Sucres > 60)

## ----filter_classic-----------------------------------------------------------
fruits[fruits$Sucres > 60, ]

## ----group--------------------------------------------------------------------
fruits %>% group_by(groupe)

## ----summarize----------------------------------------------------------------
fruits %>% 
  group_by(groupe) %>%
  summarize(SucreMoyen = mean(Sucres))

## ----summarize_classic--------------------------------------------------------
aggregate(fruits$Sucres, 
          by = list(fruits$groupe), 
          FUN = mean)


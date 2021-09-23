## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  echo = TRUE
)
library(ggplot2)

## ----gggenes, message = FALSE-------------------------------------------------
library(gggenes)
library(trackViewer)

## ----example------------------------------------------------------------------
head(example_genes)

## ----gggene1, eval = FALSE----------------------------------------------------
#  ggplot(example_genes,
#         aes(xmin = start,
#             xmax = end,
#             y = molecule,
#             fill = gene)) +
#    geom_gene_arrow() +
#    facet_wrap( ~ molecule,
#                scales = "free",
#                ncol = 1) +
#    scale_fill_brewer(palette = "Set3") +
#    theme_genes()

## ----gggene2, echo = FALSE----------------------------------------------------
ggplot(example_genes,
       aes(xmin = start,
           xmax = end,
           y = molecule,
           fill = gene)) +
  geom_gene_arrow() +
  facet_wrap( ~ molecule, 
              scales = "free", 
              ncol = 1) +
  scale_fill_brewer(palette = "Set3") +
  theme_genes()

## ----data---------------------------------------------------------------------
load("../data/methylation.Rdata")
# data("methy", package = "tidyViz")
# data("features", package = "tidyViz")
# data("gr", package = "tidyViz")

## ----lolliplot----------------------------------------------------------------
lolliplot(methy, features, ranges=gr)

## ----dandelionplot------------------------------------------------------------
dandelion.plot(methy, features, ranges=gr)


## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  echo = TRUE
)
library(dplyr)
library(magrittr)

## ----ggplot2------------------------------------------------------------------
library(ggplot2)

## ----data---------------------------------------------------------------------
data("fruits", package = "tidyViz")

## ----barplot------------------------------------------------------------------
barplot(table(fruits$groupe))

## ----barplot_couleur----------------------------------------------------------
barplot(table(fruits$groupe), col = 1:4)

## ----geom_bar_stop, fig.width = 5, fig.height = 4-----------------------------
ggplot(data = fruits, aes(x = groupe, fill = groupe)) +
  geom_bar()

## ----acompleter, eval = FALSE-------------------------------------------------
#   ggplot(***,
#       aes(***,
#       fill = Sucres > 10)) +
#     geom_***()

## ----geom_bar_ter-------------------------------------------------------------
ggplot(fruits, aes(cut(Eau, c(0, 84.2, 100)))) + 
  geom_bar(fill = "steelblue")

## ----geom_col, fig.height = 2-------------------------------------------------
dat.count <- fruits %>% 
  group_by(groupe) %>%
  summarize(Csup10 = sum(VitamineC >= 10))

ggplot(data = dat.count, aes(x = groupe, y = Csup10)) +
  geom_col()

## ----sucrebatons, out.width = "100%"------------------------------------------
ggplot(fruits, aes(Sucres)) + 
  geom_bar()

## ----sucrehist, out.width = "100%", message = FALSE---------------------------
ggplot(fruits, aes(Sucres)) + 
  geom_histogram()

## ----histodefo, fig.height = 3, fig.width = 3, message = FALSE----------------
ggplot(fruits, aes(Sucres)) + 
  geom_histogram()

## ----histo1, echo = FALSE, fig.height = 3-------------------------------------
ggplot(fruits, aes(Sucres)) + 
  geom_histogram(breaks = seq(0, 75, 5))

## ----histo1 code, eval = FALSE------------------------------------------------
#  ggplot(fruits, aes(Sucres)) +
#    geom_histogram(breaks = seq(0, 75, 5))

## ----histo2, echo = FALSE, fig.height = 3-------------------------------------
ggplot(fruits, aes(Sucres)) + 
  geom_histogram(breaks = seq(0, 75, 5),
                 fill = "steelblue")

## ----histo2 code, eval = FALSE------------------------------------------------
#  ggplot(fruits, aes(Sucres)) +
#    geom_histogram(breaks = seq(0, 75, 5),
#                   fill = "steelblue")

## ----histo3, echo = FALSE, fig.height = 3-------------------------------------
ggplot(fruits, aes(Sucres)) + 
  geom_histogram(breaks = seq(0, 75, 5),
                 fill = "steelblue",
                 color = "white")

## ----histo3 code, eval = FALSE------------------------------------------------
#  ggplot(fruits, aes(Sucres)) +
#    geom_histogram(breaks = seq(0, 75, 5),
#                   fill = "steelblue",
#                   color = "white")

## ----boxplot, fig.height = 4--------------------------------------------------
ggplot(data=fruits, aes(x = Sucres)) + 
  geom_boxplot()

## ----boxplot2, fig.height = 4-------------------------------------------------
ggplot(data=fruits, aes(x=groupe, y=Sucres)) + 
  geom_boxplot()

## ----violinplot, fig.height = 4-----------------------------------------------
ggplot(data=fruits, aes(x = Sucres, y = 1)) + 
  geom_violin()

## ----violinplot2, fig.height = 4----------------------------------------------
ggplot(data=fruits, aes(x = groupe, y = Sucres)) + 
  geom_violin()

## ----codeacompleter, eval = FALSE---------------------------------------------
#  ggplot(fruits,
#         aes(x = Fibres > 1.5,
#             y = Proteines,
#             fill = ***)) +
#    geom_***()

## ----histotheme1, message=FALSE, fig.height=3---------------------------------
ggplot(fruits, aes(Fibres)) + 
  geom_histogram() + 
  theme_bw()

## ----histotheme2, message=FALSE, fig.height=3---------------------------------
ggplot(fruits, aes(Fibres)) + 
  geom_histogram() + 
  theme_minimal()

## ----histotheme3, message = FALSE, fig.height=3-------------------------------
ggplot(fruits, aes(Fibres)) + 
  geom_histogram() + 
  theme_void()

## ----mysterytheme, eval = FALSE-----------------------------------------------
#  ggplot(fruits, aes(y = Fibres)) +
#    geom_boxplot() +
#    theme_***()

## ----labs, eval = FALSE-------------------------------------------------------
#  labs(
#    title = "Titre du graphe",
#    subtitle = "Sous-titre du graphe",
#    x = "Titre de l'axe des x",
#    y = "Titre de l'axe des y",
#    color = "Titre de la légende des couleurs",
#    shape = "Titre de la légende des formes"
#  )

## ----geompoint, fig.height = 3------------------------------------------------
ggplot(fruits, aes(x = Phosphore, y = Calcium, size = Magnesium)) + 
  geom_point()

## ----dans aes, fig.height = 3, fig.width = 3----------------------------------
ggplot(fruits, 
       aes(x = Phosphore, y = Calcium, 
           color = Magnesium)) + 
  geom_point() + 
  theme(legend.position = "bottom")

## ----pas dans aes, fig.height = 3, fig.width = 3------------------------------
ggplot(fruits, 
    aes(x = Phosphore, y = Calcium)) + 
  geom_point(color = "limegreen")

## ----last, eval = FALSE-------------------------------------------------------
#  ggplot(fruits, aes(x = Sucres, y = Proteines, size = Magnesium, color = groupe)) +
#    geom_point() +
#    labs(title = "Fruits (source : https://ciqual.anses.fr/)",
#         x = "Sucres (")
#    theme_minimal()
#  
#  


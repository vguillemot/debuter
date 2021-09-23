## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  echo = TRUE
)
library(ggplot2)

## ----RColorBrewer-------------------------------------------------------------
library(RColorBrewer)

## ----data---------------------------------------------------------------------
data("fruits", package = "tidyViz")

## ---- eval = FALSE, echo = FALSE----------------------------------------------
#  ------- ------- ---------- ---------- ----------- --------- -------- -------------- -------
#  Entier     1        2          3          4          5         6           7           8
#  HEX     #000000 #DF536B    #61D04F    #2297E6     #28E2E5   #CD0BBC  #F5C710        #9E9E9E
#  Couleur black   indianred2 palegreen3 dodgerblue2 turquoise magenta3 darkgoldenrod1 gray62
#  ------- ------- ---------- ---------- ----------- --------- -------- -------------- -------

## ----kableextra, echo = FALSE, results='asis'---------------------------------
library(kableExtra)

coltab <- read.table(text = 
"Entier 1 2 3 4 
Nom black indianred2 palegreen3 dodgerblue2
HEX #000000 #DF536B #61D04F #2297E6 
Entier 5 6 7 8
Nom turquoise magenta3 darkgoldenrod1 gray62
HEX #28E2E5 #CD0BBC #F5C710 #9E9E9E", comment.char = "")

coltab$V2 <- cell_spec(coltab$V2, color = rep(c("black", "turquoise"), each = 3))
coltab$V3 <- cell_spec(coltab$V3, color = rep(c("indianred", "magenta"), each = 3))
coltab$V4 <- cell_spec(coltab$V4, color = rep(c("palegreen", "darkgoldenrod"), each = 3))
coltab$V5 <- cell_spec(coltab$V5, color = rep(c("dodgerblue", "gray"), each = 3))

coltab %>%
   kable(escape = FALSE, col.names = c("", "", "", "", ""), table.attr = "style='width:100%;'", align = c("l", "c", "c", "c", "c")) %>%
   kable_styling(full_width = TRUE) %>%
   column_spec(1, bold = FALSE, border_right = TRUE, color = "white", background = "black")

## ----couleurs-----------------------------------------------------------------
barplot(rep(1,8), col = 1:8)

## ----colors-------------------------------------------------------------------
sample(colors(), 7)

## ----hex, echo = FALSE, fig.height = 2.5, fig.width = 6-----------------------
hexdat <- data.frame(
  x = 1:6,
  col = rep(c("#FF0000", "#00FF00", "#0000FF"), each = 2)
)

zesize <- 20

ggplot(hexdat, aes(x = x)) + 
  geom_point(aes(color = I(col)), y = 1, size = zesize) + 
  annotate("text", x = 0, y = 1, label = "#", size = zesize) + 
  theme_minimal() + 
  xlim(c(-0.2, 6.2)) + 
  theme_void()

## ----barplot3façons, eval = FALSE---------------------------------------------
#  barplot(rep(1, 3), col = 2:4)
#  barplot(rep(1, 3), col = c("indianred2", "palegreen3", "dodgerblue2"))
#  barplot(rep(1, 3), col = c("#DF536B", "#61D04F", "#2297E6"))

## ----legraphe3facons, echo = FALSE, fig.height = 2.5--------------------------
barplot(rep(1, 3), col = 2:4)

## ----couleurs_repetees, fig.height = 2----------------------------------------
par(mar = c(0, 0, 0, 0))
barplot(rep(1,80), col = 1:8, border = NA, space = 0, axes = FALSE)

## ----displayAll, eval = FALSE-------------------------------------------------
#  display.brewer.all()

## ----brewer.pal---------------------------------------------------------------
brewer.pal(n = 3, name = "Set3")

## ----colorRamp----------------------------------------------------------------
colfun <- colorRampPalette(c("darkorchid", "black", "limegreen"))
barplot(rep(1, 30), col = colfun(30), axes = F, border = NA)


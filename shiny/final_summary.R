library("dplyr")
library("plotly")
library("ggplot2")
library("shiny")
library("stringr")

final_side <- sidebarPanel(
  p("Some other stuff")
)

final_main <- mainPanel(
  h3("From Insight 1"),
  p("Stuff about Insight1"),
  h3("From Insight 2"),
  p("Stuff about Insight2"),
  h3("From Insight 3"),
  p("Stuff about Insight 3")
)
library(shiny)
library(plotly)

source("interactive_page_1.R")

page_one <- tabPanel(
  "Page one",
  sidebar_line_graph,
  description
)

ui <- navbarPage(
  "Movie Data",
  page_one
)
library(shiny)
library(plotly)

source("interactive_page_1.R")
source("interactive_page_2.R")

page_one <- tabPanel(
  "Page one",
  sidebar_line_graph,
  description
)

ui <- navbarPage(
  "Movie Data",
  page_one
)

page_two <- tabPanel(
  "Page two",
  sidebar_bar_chart,
  second_description
)

ui <- navbarPage(
  "Movie Data",
  page_two
)

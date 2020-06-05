library(shiny)
library(plotly)

source("interactive_page_1.R")
source("interactive_page_2.R")

page_one <- tabPanel(
  "Insight 1",
  sidebar_line_graph,
  description
)

page_two <- tabPanel(
  "Insight 2",
  sidebar_bar_chart,
  second_description
)

ui <- navbarPage(
  "Movie Data",
  page_one,
  page_two
)

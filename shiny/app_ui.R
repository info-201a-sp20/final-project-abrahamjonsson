library(shiny)
library(plotly)

source("overview.R")
source("interactive_page_1.R")
source("interactive_page_2.R")
source("interactive_page_3.R")
source("final_summary.R")

intro_page <- tabPanel(
  "Overview",
  intro_side,
  intro_summary
)

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

page_three <- tabPanel(
  "Insight 3",
  sidebar_bar_graph,
  description_three
)

ui <- navbarPage(
  "Movie Data",
  intro_page,
  page_one,
  page_two,
  page_three
)



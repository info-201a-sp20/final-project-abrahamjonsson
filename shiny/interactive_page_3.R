# Interactive page 3

# Load Libraries
library("dplyr")
library("plotly")
library("ggplot2")
library("shiny")
library("stringr")

# Load Movie Data
movie <- read.csv("../data/movies.csv")

# Makes a bar graph of score vs revenue per user inputed year
make_graph_three <- function(data, year) {
  # Filters by the year
  filtered <- movie %>%
    filter(grepl(Year, movie[, "Year"], fixed = TRUE)) %>%
    group_by(Year) %>%
    summarize(total_rev = sum(Revenue, na.rm = TRUE))
  
  # Creates a bar graph using the filterd out data, 
  final_graph <- scatterplot <- ggplot(filtered) +
    geom_point(mapping = aes_string(x = "Runtime", y = "Revenue")) +
    labs(
      title = "Relationship Between Runtime and Revenue",
      x = "Runtime",
      y = "Revenue"
    )
  
  bar_graph <- ggplotly(final_graph, tooltip = "text")
  
  return(bar_graph)
}

# sets the sidepanel for interactive page 1
sidebar_bar_graph <- sidebarPanel(
  sliderInput(
    inputId = "Year",
    label = h3("Year"),
    min = min(movie$Year),
    max = max(movie$Year),
    value = 2000
  )
)

# Sets the mainpanel for Interactive Page 3
description_three <- mainPanel(
  h3("Description of Bar Graph"),
  p("This graph showcases the score received by each movie
    in relative to its revenue produced. The user is able to
    see this data based on which year the movies were released.
    Using this data, you are able to see how each year has impacted
    the amount of movies created as well as the revenue changes
    happening year after year."),
  plotlyOutput("bargraph")
)
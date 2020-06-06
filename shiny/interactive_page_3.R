# Interactive page 3

# Load Libraries
library("dplyr")
library("plotly")
library("ggplot2")
library("shiny")

movie <- read.csv("data/movies.csv")

# Makes a bar graph of score vs revenue per user inputed year
make_graph_three <- function(data, year) {
  # Filters by the year
  filtered <- movie %>%
    filter(year == movie[, "Year"]) %>%
    group_by(Score) %>%
    summarize(total_rev = sum(Revenue, na.rm = TRUE))
  
  # Creates a bar graph using the filterd out data, 
  final_graph <- scatterplot <- ggplot(filtered) +
    geom_point(mapping = aes_string(x = "Score", y = "total_rev")) +
    labs(
      title = "Relationship Between Score and Revenue",
      x = "Score",
      y = "Revenue"
    )
  
  bar_graph <- ggplotly(final_graph)
  
  return(bar_graph)
}

# sets the sidepanel for interactive page 3
sidebar_bar_graph <- sidebarPanel(
  sliderInput(
    inputId = "year",
    label = h3("Year"),
    min = min(movie$Year),
    max = max(movie$Year),
    value = 2000
  )
)

# Sets the mainpanel for Interactive Page 3
description_three <- mainPanel(
  h3("Description of Scatter Plot"),
  p("This graph showcases the score received by each movie
    in relative to its revenue produced. The user is able to
    see this data based on which year the movies were released.
    Using this data, you are able to see how each year has impacted
    the amount of movies created as well as the revenue changes
    happening year after year. As you can see from the graph, the newest movies tend to
    have high scores. The movies that are older, or 'vintage', also tend to have high 
    scores. In general, there is a trend showing that the most recent movies and 
    the oldest movies have higher scores than movies in between.This could potentially 
    be caused by excitement for new movies and appreciation for older movies"),
  plotlyOutput("scatter")
)

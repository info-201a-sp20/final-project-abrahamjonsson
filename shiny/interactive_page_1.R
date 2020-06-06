library("dplyr")
library("plotly")
library("ggplot2")
library("shiny")

movie <- read.csv("data/movies.csv")

# Generates a line graph of year vs revenue
making_line_graph <- function(data, genre) {
  # Filters out the movies by those with the appropriate genre classification.
  # If the movie is classifed as a certain genre even if multiple genres
  # are applicable, it passes the filter. (if movie is adventure, comedy, and
  # action, it counts as an action movie)
  filtering <- data %>%
    filter(grepl(genre, data[, "Genre"], fixed = TRUE)) %>%
    group_by(Year) %>%
    summarize(total_rev = sum(Revenue, na.rm = TRUE))
  
  # Uses the filtered out movies to create a line graph out of Revenue and Year
  result_graph <- ggplot(filtering, aes(x = Year, y = total_rev)) +
    geom_line(aes(
      x = Year,
      y = total_rev
    )) +
    suppressWarnings(geom_point(aes(
      x = Year,
      y = total_rev,
      text = paste0("Year: ", Year, "<br>", "Revenue: ", total_rev)
    ))) +
    labs(
      title = paste("Movie Earnings for", genre, "Movies"),
      x = "Year",
      Y = "Revenue"
    )
  plot_graph <- ggplotly(result_graph, tooltip = "text")
  
  return(plot_graph)
}

# gets all the unique genres and stores as list
get_genre <- function(x) {
  return(strsplit(x, "[,]")[[1]][1])
}
genre_list <- unique(lapply(as.character(movie["Genre"][[1]]), get_genre))
names(genre_list) <- genre_list

# sets the sidepanel for interactive page 1
sidebar_line_graph <- sidebarPanel(
  selectInput(
    inputId = "genre",
    label = h3("Genres"),
    choices = genre_list
    )
)

# sets the mainpanel for interactive page 1
description <- mainPanel(
  h3("Description of Graph"),
  p("The line graph conveys the pattern of the total earnings
  of the movies of the selected genre from each year spanning from 1925 to 2018.
  Upon analyzing this graph, one can see that for most genres there has been
  an exponential growth of total revenues for the movies, and there exists a
  pattern where it conveys how more recent the year, more revenue there are."),
  plotlyOutput("linegraph")
  )


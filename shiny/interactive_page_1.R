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
  p("This graph was created in attempt to answer what the relationship between
    the release years and the total earnings of the movies. 
    The displayed line graph shows how the revenues from each genre has
    been exponentially increasing by the years; though this observation
    does not apply to all genres, it seems as like that is the general
    pattern. Such pattern exists probably because of the rise in popularity
    of that particular genre as well as the popularity of cinema overall.
    "),
  plotlyOutput("linegraph")
  )


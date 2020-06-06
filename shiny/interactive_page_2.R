library("dplyr")
library("plotly")
library("ggplot2")
library("shiny")

movie <- read.csv("../data/movies.csv")

# Generates a bar chart of Runtime vs revenue based on Director
making_bar_chart <- function(data, director) {
  # Filters movies made by user inputted director
  filtering <- movie %>%
    filter(director == movie[, "Director"]) %>%
    group_by(Runtime) %>%
    summarize(total_rev = sum(Revenue, na.rm = TRUE))
  
  # Uses the filtered movies to create a bar chart based on Revenue and Runtime
  result_chart <- ggplot(filtering, aes(x = Runtime, y = total_rev)) +
    geom_bar(stat = "identity") +
    suppressWarnings(geom_point(aes(
      x = Runtime,
      y = total_rev,
      text = paste0("Runtime: ", Runtime, "<br>", "Revenue: ", total_rev)
    ))) +
    labs(
      title = paste("Movie Revenue based on Runtime for", director),
      x = "Runtime",
      Y = "Revenue"
    )
  plot_chart <- ggplotly(result_chart, tooltip = "text")
  
  return(plot_chart)
}

# Stores all the directors in a list
get_director <- function(x) {
  return(strsplit(x, "[,]")[[1]][1])
}
director_list <- unique(lapply(as.character(movie["Director"][[1]]), get_director))
names(director_list) <- director_list

# Creates the side panel for interactive page 2
sidebar_bar_chart <- sidebarPanel(
  selectInput(
    inputId = "director",
    label = h3("Directors"),
    choices = director_list
  )
)

# Creates the mainpanel for interactive page 2
second_description <- mainPanel(
  h3("Description of Chart"),
  p("This bar chart shows the pattern between runtime and revenue. 
     Previously, there were other factors that influenced the relationship between the two.
     By allowing the user to filter based on director, the user can analyze the 
     the direct relationship between runtime and revenue. Users can also see the
     revenue, grouped by runtime, for movies from 1925-2018 made by that specific director.
    "),
  plotlyOutput("barchart")
)


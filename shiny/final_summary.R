library("dplyr")
library("plotly")
library("ggplot2")
library("shiny")
library("stringr")

final_side <- sidebarPanel(
  h2("Given the three unique graphs and analyses of the data from insights 1-3,
     we were able to pull a few key takeaways."),
  imageOutput('../www/movietheater.jpg')
)

final_main <- mainPanel(
  h3("From Insight 1"),
  p("Upon analyzing this graph, one can see that for most genres there has been
  an exponential growth of total revenues for the movies, and there exists a
  pattern where it conveys how more recent the year, more revenue there are."),
  h3("From Insight 2"),
  p("Previously, there were other factors that influenced the relationship between the two.
     By allowing the user to filter based on director, the user can analyze the 
     the direct relationship between runtime and revenue. Users can also see the
     revenue, grouped by runtime, for movies from 1925-2018 made by that specific director."),
  h3("From Insight 3"),
  p("The user is able to
    see this data based on which year the movies were released.
    Using this data, you are able to see how each year has impacted
    the amount of movies created as well as the revenue changes
    happening year after year.")
)
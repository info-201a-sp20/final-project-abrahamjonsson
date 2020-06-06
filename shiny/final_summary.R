library("dplyr")
library("plotly")
library("ggplot2")
library("shiny")
library("stringr")

final_side <- sidebarPanel(
  h2("Given the three unique graphs and analyses of the data from insights 1-3,
     we were able to pull a few key takeaways.")
)

final_main <- mainPanel(
  h3("From Insight 1"),
  p("Upon analyzing this graph, one can see that for most genres there has been
  an exponential growth of total revenues for the movies, and there exists a
  pattern where it conveys how more recent the year, more revenue there are. Given this
    trend, we can make the assumption that revenue will continue to rise as the years go
    on."),
  h3("From Insight 2"),
  p("Users can also see the
     revenue, grouped by runtime, for movies from 1925-2018 made by that specific director.
     As you can see in the data for Stephen King, there is a strong positive relationship
     between runtime and revenue. In general, you can see that as runtime increases, 
     revenue tends to increase. Given this trend, we can make the assumption that the 
    data will continue to show that for each director, as runtime increases, revenue will also
    increase."),
  h3("From Insight 3"),
  p("The movies that are older, or 'vintage', also tend to have high 
    scores. In general, there is a trend showing that the most recent movies and 
    the oldest movies have higher scores than movies in between. This could potentially 
    be caused by excitement for new movies and appreciation for older movies.")
)
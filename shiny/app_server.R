library(dplyr)
library(plotly)

source("interactive_page_1.R")
source("interactive_page_2.R")

df <- read.csv('../data/movies.csv', stringsAsFactors = FALSE)

server = function(input, output) {
  output$linegraph <- renderPlotly(
    return(making_line_graph(df, input$genre))
  )
  
  output$barchart <- renderPlotly(
    return(making_bar_chart(df, input$director))
  )
}
movies <- read.csv(file = "data/movies.csv")

library(dplyr)
library(ggplot2)

## Function contains a hex graph that displays the relationship
## between year and revenue for the dataset.

chart1_function <- function(df) {
  scatterplot <- ggplot(df, aes(x = Year, y = Revenue)) + 
    geom_hex(color = "white", fill = "blue") +
    labs(
      title = "Relationship Between Year and Revenue",
      x = "Year of Release",
      y = "Revenue (in Millions)"
    )
  return(scatterplot) 
}

## Using a hexplot is an effective way for visualizing the relationship 
## between the year the movie was released and the revenue produced.

## As seen in the hexplot, revenue has drastically increased since the early
## 1900's. The graph shows a consistent upwards slope on average, as well 
## as a max revenue of 936.66 million dollars in 2015.



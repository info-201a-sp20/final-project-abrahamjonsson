# Chart 1 Function

# Loading all packages needed
library(dplyr)
library(ggplot2)
library(lintr)

## Function contains a hex graph that displays the relationship
## between year and revenue for the dataset.

get_chart1_function <- function(df) {
  scatterplot <- ggplot(df, aes(x = Year, y = Revenue)) +
    geom_hex(color = "white", fill = "blue") +
    labs(
      title = "Relationship Between Year and Revenue",
      x = "Year of Release",
      y = "Revenue (in Millions)"
    )
  return(scatterplot)
}
lintr::lint("chart1.R")
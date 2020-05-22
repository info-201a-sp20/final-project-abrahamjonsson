# Loading all packages needed
library(ggplot2)
library(dplyr)

# Load data
df <- read.csv("~/Desktop/INFO201/final-project-abrahamjonsson/data/movies.csv")

# Creates a function that returns a barchart  
# showing the relationship between Directors and Revenue
chart2_function <- function(df) {
  barchart <- df %>%
    ggplot(aes_string(x = "Director", y = "Revenue")) +
    geom_bar(stat = "identity") +
    labs(
      title = "Director vs. Revenue",
      x = "Director",
      y = "Revenue") +
    coord_cartesian(ylim = c(0, 200))
  return(barchart)
}


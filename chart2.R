# Chart 2 Function
# Loading all packages needed
library(ggplot2)
library(dplyr)

# Load data
df <- read.csv("data/movies.csv")

# Creates a function that returns a barchart  

# showing the relationship between Directors and Revenue
get_chart2_function <- function(df) {
  barchart <- df %>%
    ggplot(aes_string(x = "Score", y = "Revenue")) +
    geom_bar(stat = "identity") +
    labs(
      title = "Score vs. Revenue",
      x = "Score",
      y = "Revenue")
  return(barchart)
}


# This barchart is a useful way to visualize the relationship between
# score of the movie and revenue from the movie. 


# As seen in the barchart, the highest revenues are centered around the 
# movies with a score of 6.5.

lintr::lint("chart2.R")


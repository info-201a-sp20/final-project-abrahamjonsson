# Chart 3 Function
# Loading all packages needed
library(ggplot2)
library(dplyr)
library(lintr)

# Creates a function which returns a scatterplot
# showing the relationship between Runtime and Revenue
get_chart3_function <- function(df) {
  scatterplot <- ggplot(df) +
    geom_point(mapping = aes_string(x = "Runtime", y = "Revenue")) +
    labs(
      title = "Relationship Between Runtime and Revenue",
      x = "Runtime",
      y = "Revenue"
    )
  return(scatterplot)
}

lintr::lint("chart3.R")
# Loading all packages needed
library(ggplot2)
library(dplyr)
library(lintr)

# Load data
df <- read.csv("~/Desktop/INFO201/final-project-abrahamjonsson/data/movies.csv")

# Creates a function which returns a scatterplot 
# showing the relationship between Runtime and Revenue
chart3_function <- function(df) {
  scatterplot <- ggplot(df) +
    geom_point(mapping = aes_string(x = "Runtime", y = "Revenue")) +
    labs(
      title = "Relationship Between Runtime and Revenue",
      x = "Runtime",
      y = "Revenue"
    ) +
    geom_smooth(method = lm, formula = y ~ splines::bs(x, 3), se = FALSE,
                mapping = aes_string(x = "AST", y = "PTS"))
  return(scatterplot)
}

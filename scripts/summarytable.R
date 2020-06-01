# Function summarizes the given dataframe and calculates 5 information
# (number of titles under a genre, total revenue, average score,
#  average metascore, and the average runtime of each genres)
# from the provided columns within the dataframe, and then it returns
# the resulting dataframe as a table.

# Loading all packages needed
library(dplyr)
library(knitr)

# Summary Table Function
get_summary_table <- function(dataset) {
  new_names <- data.frame("Genre", "Number of Titles",
                          "Revenue", "Average Score",
                          "Average Metascore", "Average Run Time"
                          )
  summarising <- dataset %>%
  group_by(Genre) %>%
  summarize(num_of_titles = length(Genre),
            revenue = sum(Revenue, na.rm = TRUE),
            avg_score = round(mean(Score, na.rm = TRUE), 1),
            avg_metascore = round(mean(Metascore, na.rm = TRUE), 1),
            avg_runtime = round(mean(Runtime, na.rm = TRUE), 1)
            )
  result_table <- kable(summarising, col.names = gsub("[X.]", " ", names(new_names)))
  return(result_table)
}
lintr::lint("summarytable.R")

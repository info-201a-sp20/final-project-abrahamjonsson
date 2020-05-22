library(dplyr)

# Function summarizes the given dataframe and calculates 5 information
# (number of titles under a genre, total revenue, average score,
#  average metascore, and the average runtime of each genres)
# from the provided columns within the dataframe, and then it returns
# the resulting dataframe as a table.

summary_table <- function(dataset) {
  summarising <- dataset %>%
  group_by(Genre) %>%
  summarize(num_of_titles = length(Genre),
            revenue = sum(Revenue, na.rm = TRUE),
            avg_score = round(mean(Score, na.rm = TRUE), 1),
            avg_metascore = round(mean(Metascore, na.rm = TRUE), 1),
            avg_runtime = round(mean(Runtime, na.rm = TRUE), 1)
            )
  result_table <- kable(summarising)
  return(result_table)
}

# Including the table in our analysis of the movies provides an organized
# and visually appealing representations of given data. The organization
# allows readers to analyze the data for themselves to come to brief
# conclusions about the information. It can be used to convey relationships
# between different factors; it can also be used to show interesting patterns.
#
# This particular table reveals that the most of the genres' average scores
# tend to span between 5 and 8, though there are some outliers to the pattern.
# Also, it appears that some of the movie genres do not even have metascores
# due to the fact that none of the movies in those genres have not gotten
# metascores. Additionally, the total gained revenues from the genres vary
# greatly.
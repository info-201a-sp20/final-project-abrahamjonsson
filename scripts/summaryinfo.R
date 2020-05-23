# A function that takes in a dataset and returns a list of info about it:
#
# - number of movies
# - number of genres
# - total vote count
# - average score
# - year span (difference between latest year and oldest year)

# Load all Packages needed
library(knitr)

get_summary_info <- function(dataset) {
  new_names <- data.frame("Length", "Number of Genres", "Votes",
                          "Average Score", "Year Span")
  ret <- data.frame(length = length(dataset),
                    num_genres = length(unique(dataset$Genre)),
                    votes = sum(dataset[, "Vote"]),
                    avg_score = round(mean(dataset[, "Score"], na.rm = TRUE), 1),
                    year_span <- max(dataset[, "Year"]) - min(dataset[, "Year"])
                   )
  ret <- kable(ret, col.names = gsub("[X.]", " ", names(new_names)))
  return(ret)
}
lintr::lint("summaryinfo.R")

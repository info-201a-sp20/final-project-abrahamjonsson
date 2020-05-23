# A function that takes in a dataset and returns a list of info about it:
#
# - number of movies
# - number of genres
# - total vote count
# - average score
# - year span (difference between latest year and oldest year)

get_summary_info <- function(dataset) {
  ret <- list()
  ret$length <- length(dataset)
  ret$num_genres <- length(unique(Genre))
  ret$votes <- sum(dataset[, "Vote"])
  ret$avg_score <- round(mean(dataset[, "Score"], na.rm = TRUE), 1)
  ret$year_span <- max(dataset[, "Year"]) - min(dataset[, "Year"])
  return(ret)
}
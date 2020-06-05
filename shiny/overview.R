library("dplyr")
library("plotly")
library("ggplot2")
library("shiny")
library("stringr")

movie <- read.csv("../data/movies.csv")

intro_side <- sidebarPanel(
  h1("This project was produced by:"),
  h3("Daniel Kim"),
  h3("Abhinav Cherukuri"),
  h3("Timothy Joo"),
  h3("Abraham Jonsson")
)

intro_summary <- mainPanel(
  h3("Overview"),
  p("In this project, we did a deep dive into the world of movies, and the 
    different relationships we can draw from the vast amount of data each 
    movie has to offer. We are interested in popular movies and films because we
    want to better understand what kinds of movies are the most financially
    successful as well as critically successful in the eyes of movie 
    reviewers. Popular movies are a huge part of the current generation's 
    culture and exploring this topic more in depth will help us understand 
    how contemporary culture appeals to society. The data from this dataset 
    was collected and organized by Michal Bogacz, and he used IMDb 
    (Internet Movie Database) as his primary source for collecting data from 
    a large set of movies. The data is a collection of the most popular movies 
    from IMDb and describes each movies with categories such as revenues, scores,
    year released, etc. The dataset contains 9,699 unique movies (rows), and
    displays 11 features (columns) for each movie.")
)
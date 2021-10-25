## TIDY TUESDAY 3-9-21 ##

## Load data and libraries ##
library(tidyverse)

movies <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/movies.csv')


## BAR PLOT - USA MOVIE PARTNERSHIP BARPLOT

partners <- c("USA, Canada", "USA, Germany", "USA, UK", "USA, France")

#pipeline start
movies %>%
  #filter movies for selected countries
  filter(country %in% partners) %>%
  # pipe ggplot
  ggplot() + 
  # add aes with fill mapped to country and ordered by count
  aes( fill = country, x = fct_infreq(country)) +
  # add barplot function
  geom_bar(color = "hotpink2") +
  # add labels
  labs(x = "USA Partnerships", 
       y = "Count") +
  # add theme
  theme_minimal() +
  # change name of legend
  scale_fill_discrete(name = "USA Partnership") -> movies_barplot

#save file 
ggsave("usa_movie_partnerships.png", movies_barplot, width = 8, height = 5)


## USA MOVIES IMDB RATING DENSITY PLOT

#start pipeline
movies %>%
  #filter for selected country
  filter(country == "USA") %>%
  #ggplot function
  ggplot() +
  #aes with x = imdb_rating
  aes(x = imdb_rating) + 
  #add labels
  labs(x = "IMDB Rating", y = "Density") +
  #add density plot function
  geom_density(fill = "red4", color = "red") -> movies_densityplot

#save file
ggsave("usa_imdb_ratings.png", movies_densityplot, width = 6, height = 4)






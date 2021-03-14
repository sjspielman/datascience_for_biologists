# load tidyverse library
library(tidyverse)

# read in tidytuesday data
movies <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/movies.csv')

movies %>% # pipe in dataset
  select(imdb_rating, rated) %>% # isolate variables
  drop_na(imdb_rating, rated) %>% # remove rows containing NA
  filter(rated %in% c("G", "PG", "PG-13", "R")) -> movies_sub # filter by rating and define variable

tidyplot <- movies_sub %>% # pipe in data subset and define variable
  ggplot() + # add ggplot
  aes(x = imdb_rating) + # add variable to x-axis
  geom_histogram(bins = 15, # specify bin number
                 color = "black", #specify color
                 fill = "plum2") + # specify fill
  facet_wrap(vars(rated)) + # facet across ratings
  labs(x = "imdb rating") + # change x-axis label
  theme_bw() # add bw theme

ggsave("tidytuesday_figure.png", tidyplot, # save tidyplot
       width = 5, # specify width
       height = 4) # specify height
  

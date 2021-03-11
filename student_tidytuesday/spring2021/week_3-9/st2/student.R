library(tidyverse)


raw_bechdel <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/raw_bechdel.csv')
movies <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/movies.csv')

my_ratings <- movies %>%
  filter(rated %in% c("G", "PG", "PG-13", "R")) %>%
  select(rated, everything())

my_movies <- ggplot(my_ratings)+
  aes(x = imdb_rating, fill = rated)+
  #facet_wrap(vars(rated))+
  geom_density(alpha = 0.5)+
  labs(x = "IMDB Rating", title = "IMDB ratings by TV rating")+
  scale_fill_discrete(name = "TV Ratings")

print(my_movies)

ggsave("student_movies.png", my_movies, width = 8, height = 4)
  

my_movies_2 <- ggplot(my_ratings)+
  aes(x = imdb_rating, fill = rated)+
  facet_wrap(vars(rated))+
  geom_density()+
  labs(x = "IMDB Rating", title = "IMDB ratings by TV rating")+
  scale_fill_discrete(name = "TV Ratings")

print(my_movies_2)

ggsave("student_movies_2.png", my_movies_2, height = 4, width = 6)

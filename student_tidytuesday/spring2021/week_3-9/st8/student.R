# install.packages("tidyverse")
library(tidyverse)
movies <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/movies.csv')

movies %>%
  filter(rated %in% c("G", "PG", "PG-13", "R")) %>%
  ggplot() +
  aes(x = fct_relevel(rated, c("G", "PG", "PG-13", "R")), fill = binary) +
  geom_bar(position = "dodge", color = "black") +
  scale_fill_brewer(palette = "Set2", name = "Bechdel Result")  +
  labs(x = "Movie Rating", y = "Numbers of Movies", title = "Ratings and Bechdel Test") +
  theme_minimal() -> ratings_bechdel
ggsave("ratings_bechdel.png", ratings_bechdel, height = 3, width = 5)  

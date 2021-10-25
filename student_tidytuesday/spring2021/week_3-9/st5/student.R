
# load library
library(tidyverse)
# load data
movies <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/movies.csv')


movies %>%
  filter(country == "USA") %>%
  ggplot() +
  aes(x = binary) +
  labs(x = "binary", y = "count") +
geom_bar(color = "black", fill = "pink") -> plot

print(plot)

ggsave("tidy_tuesplot.png", plot, width = 8, height = 6)


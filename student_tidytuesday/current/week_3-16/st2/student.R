# load library
library(tidyverse)
# load data
games <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-16/games.csv')

games %>%
  ggplot() +
  aes(x = month) +
  labs(x = "Month of measure", y = "count") +
  geom_bar(color = "black", fill = "pink") -> lexis_plot2

print(lexis_plot2)

ggsave("plot.png", lexis_plot2, width = 8, height = 6)


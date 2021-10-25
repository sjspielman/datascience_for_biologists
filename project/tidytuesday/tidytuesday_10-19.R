library(tidyverse)

pumpkins <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-10-19/pumpkins.csv')


pumpkins %>%
  mutate(weight_lbs = as.numeric(weight_lbs)  ) -> pump_num


ggsave("whatever.png")
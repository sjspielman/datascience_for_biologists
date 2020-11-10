library(tidyverse)
ikea <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-11-03/ikea.csv')

ggplot(ikea, aes(x = price)) +
  geom_histogram() +
  facet_wrap(vars(category)) +
  labs(x = "Price of Furniture (Dollars)", y = "Number of Furniture", title = "Histograms of the different Furniture For Sale at Ikea ")
ggsave("ikea_figure.png", width = 12, height = 8)

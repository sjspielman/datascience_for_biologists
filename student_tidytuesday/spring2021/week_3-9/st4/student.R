library(tidyverse)
movies <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/movies.csv')

ggplot(movies)+
  aes(x=metascore, y=budget)+
  ylim(0, 2.0e+08)+
  geom_density_2d_filled(contour_var = "ndensity")+
  facet_wrap(vars(clean_test)) + 
  theme(legend.position = "none") -> tidytues_plot1
ggsave("tidytues_plot1.png", tidytues_plot1, width = 8, height = 5)


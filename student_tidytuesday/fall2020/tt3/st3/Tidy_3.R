library(tidyverse)
wind <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-10-27/wind-turbine.csv')
ggplot(wind, aes(x = total_project_capacity_mw, y = turbine_rated_capacity_k_w)) +
  geom_point() +
  geom_smooth(method ="lm") +
  labs(x = "Total Project Capacity (MW)", y = "Turbine Rated Capacity (KW)", title = "Total Project Capacity Vs Turbine Rated Capacity")
ggsave("wind_figure.png", width = 8, height = 6)

library(tidyverse)
library(RColorBrewer)
wind_turbine <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-10-27/wind-turbine.csv')
#View(wind_turbine)

wind_turbine %>%
  select(commissioning_date, total_project_capacity_mw, province_territory) %>%
  filter(commissioning_date %in%(2005:2007)) %>%
  ggplot(mapping = aes(x= province_territory, y= total_project_capacity_mw, color= province_territory)) +
  geom_violin() +
  geom_jitter(alpha = 0.4, size= 2) +
  scale_color_brewer(palette= "Dark2") +
   stat_summary() +
   labs(x= "Province",
       y= "Turbine Capacity (mw)",
       title = "Turbine Capacity in mw") +
  theme_classic() -> Turbine_plot

ggsave("Turbine_plot.png", width = 8, height = 4)

  



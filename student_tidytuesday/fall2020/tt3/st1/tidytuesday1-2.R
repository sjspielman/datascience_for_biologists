library(tidyverse)

wind_turbine <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-10-27/wind-turbine.csv')

wind_turbine%>%
  select(province_territory, turbine_rated_capacity_k_w, latitude)%>%
  filter(province_territory %in% c("Alberta","Quebec"))%>%
  drop_na()%>%
  ggplot(aes(x=province_territory, y=turbine_rated_capacity_k_w,fill=province_territory))+
  geom_boxplot()+
    labs(x= "Province Territory", y="Turbine Rated Capacity")+
  theme_classic()+
  scale_fill_brewer(palette = "Dark2", name = "Province Territory") -> wind_turbine_figure

ggsave("wind_turbine_figure.png")




# scientific question: How does the turbine rated capacity differ between Alberta and Quebec?

# scientific question answer/observation: The median turbine rated capacity is slightly lower than the median turbine rated capacity for Quebec. The turbine rated capacities in Quebec have an overall higher distribution than the turbine rated capacities in Alberta. Alberta, however, has some outlier values in the turbine rated capacity.  

  

library(tidyverse)
wind_turbine <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-10-27/wind-turbine.csv')

wind_turbine%>%
  drop_na(province_territory, turbine_rated_capacity_k_w)%>%
  select(province_territory, turbine_rated_capacity_k_w)%>%
  ggplot(aes(x=province_territory, y=turbine_rated_capacity_k_w))+
  geom_jitter(color="deeppink4", width=0.2)+
  stat_summary(size=0.7)+
  theme_classic()+
  labs(x="Province or Territory", y= "Turbine Rated Capacity (kw)", title= "Turbine Rated Capacity for Wind Turbines in Canadian Territories and Provinces")+
  theme(plot.title = element_text(face="bold"), axis.text.x = element_text(angle = 90, face = "bold"))->Tidy_Tuesday_Oct27.png
ggsave("Tidy_Tuesday_Oct27.png", width=9, height=6)
  
  
  
  
  
















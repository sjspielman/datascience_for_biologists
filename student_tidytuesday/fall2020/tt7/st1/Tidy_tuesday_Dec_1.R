
library(tidyverse)
shelters <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-12-01/shelters.csv')

shelters%>%
  select(occupancy,capacity, shelter_city)%>%
  mutate(capacity_true=if_else(capacity== 0 ,1, capacity))%>%
  mutate(occ_over_capacity=occupancy/capacity_true)%>%
  group_by(shelter_city)%>%
  drop_na(occ_over_capacity)%>%
  summarize(mean_occ_over_capacity=mean(occ_over_capacity))%>%
  ggplot(aes(x=shelter_city, y=mean_occ_over_capacity, fill=shelter_city))+
  geom_col()+
  geom_text(aes(label= round(mean_occ_over_capacity, 2)), vjust=-0.25)+
  theme_classic()+
  scale_fill_brewer(palette = "Dark2", name= "City")+
  labs(title="Mean Occupancy Over Capacity of Canadian Shelters in 4 Different Cities", x= "City", y="Mean Occupancy Over Capacity")+
  theme(plot.title = element_text(face = "bold"))->Tidy_tues_Dec_1.png

ggsave("Tidy_tues_Dec_1.png", height=6, width=7)

 

















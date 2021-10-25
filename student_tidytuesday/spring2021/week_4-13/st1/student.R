library(tidyverse)
post_offices <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-13/post_offices.csv')


post_offices%>%
  filter(state == "NJ")%>%
  filter(county1 == "GLOUCESTER")%>%
  filter(gnis_feature_class == "Post Office")%>%
  ggplot()+
  aes(x=latitude, y=longitude, color = name)+
  geom_point(size = 4)+
  geom_text(aes(x = latitude, y = longitude+0.01, label = name, color = name), fontface="bold", size=7)+
  theme_bw()+
  labs(x="Latitude", y="Longitude", title="Post Offices within Gloucester County, NJ")+
  theme(legend.position = "none", text = element_text(size = 28)) -> tidytues_plot6

print(tidytues_plot6)
ggsave("tidytues_plot6.png", tidytues_plot6, width = 24, height =13)

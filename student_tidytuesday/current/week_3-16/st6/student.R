library(tidyverse)
games <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-16/games.csv')
games%>%
  filter(gamename == "Team Fortress 2")%>%
ggplot()+
  aes(x=year, y=peak, fill=year)+
  geom_col()+
  scale_fill_gradient(low = "royalblue1", 
                       high = "indianred3", 
                       name = "Year")+
  labs(y="Peak", x="Year")+
  theme_bw() -> tidytues_plot2
print(tidytues_plot2)
ggsave("tidytues_plot2.png", tidytues_plot2, width = 6, height = 4)


  
library(tidyverse)
games <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-16/games.csv')
#View(games)

game_data<-games%>%
  select(gamename,avg,peak,month,year)%>%
  group_by(gamename)%>%
  filter(avg>500000,peak>1000000,year%in%c("2017","2018"))%>%
  ungroup()%>%
  arrange(-peak)

#game_data

plot_1<-ggplot(game_data)+
  aes(x=avg,
      y=peak)+
  geom_point(color="deeppink",
             shape=23,
             fill="lightgray",
             size=3,
             alpha=0.6)+
  facet_wrap(vars(year))+
  theme_dark()+
  theme(axis.text.x=element_text(angle=45))+
  labs(x="Average Number of Players at Once",
       y="Peak Number of Players at Once")+
  theme(panel.background = element_rect(fill = "snow"))+
  theme(strip.background = element_rect(fill = "pink2", 
                                        color = "pink2",
                                        size = rel(3)))


#print(plot_1)

ggsave( "plot_1.png",plot_1,width = 7,height = 7)
  
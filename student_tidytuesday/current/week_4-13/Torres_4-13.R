library(tidyverse)
post_offices <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-13/post_offices.csv')


post_office_new<-post_offices%>%
  filter(established%in%1760:1960,
         state==c("NJ","NY","PA","DE","MD","VA","NC","SC","GA","RI","CT","MA","NH"))%>%
  select(state,established)



post_office_plot<-post_office_new%>%
  ggplot+
  aes(x=state,
      y=established)+
  geom_col(color="firebrick2")+
  labs(title = "Established Post Offices from 1760-1960 in America's Thirteen Colonies",
       y="Number of Post Offices Established",
       x="State")+
  theme_classic()

ggsave("post_office_plot.png",post_office_plot,width = 8,height = 6)



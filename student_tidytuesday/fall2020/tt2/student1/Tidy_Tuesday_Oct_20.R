library(tidyverse)

beer_awards <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-10-20/beer_awards.csv')



beer_awards%>%
  select(medal, state)%>%
  filter(medal=="Gold")%>%
  group_by(state)%>%
  count(medal)%>%
  rename(number_of_golds=n)%>%
  arrange(desc(number_of_golds))%>%
  filter(number_of_golds>=43)%>%
  ggplot(aes(x=state, y=number_of_golds))+
  geom_col(fill="darkgoldenrod3", color="black")+
  geom_text(aes(label=number_of_golds), position=position_dodge(width=0.9), vjust=-0.25)+
  theme_classic()+
  labs(x= "State", y="Number of Gold Medals Awarded", title= "States With The Most Gold Medal Beers", subtitle = "Medals Awarded at the Great American Beer Festival Since 1987")+
  theme(plot.title = element_text(face = "bold"), axis.text = element_text(face = "bold"))->Tidy_Tuesday_Oct20.png

ggsave("Tidy_Tuesday_Oct20.png", width=8, height=7)

  
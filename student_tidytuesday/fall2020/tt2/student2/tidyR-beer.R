################################################################################


# Load in tidyverse
library(tidyverse)
# Load in the csv file#
beer_awards <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-10-20/beer_awards.csv')

#Question: Did Michigan or Virginia win the most gold medals for having the best beer?
c("MI", "VA")->two_state_beers
beer_awards%>%
  select(medal, state, beer_name)%>%
  filter(state %in% two_state_beers)%>%
  ggplot(aes(y=state, fill= medal))+
  theme_bw()+
  geom_bar()+
  scale_fill_brewer(palette="Set2", name= "Medal Type")+
  labs(x= "Number of Medals", y= "States", title="Amount of Medals Awarded for Beer in Michigan and Virginia")-> beer_state_awards_plot

ggsave("beer_awards.png", beer_state_awards_plot, height= 4, width= 6)



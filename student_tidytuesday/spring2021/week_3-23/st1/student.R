library(tidyverse)
unvotes <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-23/unvotes.csv')
roll_calls <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-23/roll_calls.csv')
issues <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-23/issues.csv')


unvotes_mini_data<-unvotes%>%
  filter(country%in%
           c("United States","Canada","Mexico" ))%>%
  group_by(country)%>%
  count(country,vote,name="number_of_votes")


plot_1<-unvotes_mini_data%>%
  ggplot()+
  aes(x=vote,
      y=number_of_votes,
      fill=vote)+
  geom_col(color = "black", size = 0.25, position="dodge2")+
  labs(title = "North American Voting in the UN",
       x="Vote Type",
       y="Number of Votes")+
  scale_fill_brewer(name="Country",palette = "Pastel1")+
  theme_light()+
  facet_wrap(vars(country))+
  theme(legend.position = "none")+
  geom_text(aes(x=vote,
                y=number_of_votes+200,
                label=number_of_votes))

print(plot_1)  


ggsave("plot_1.png",plot_1,width = 7,height = 6)





#install.packages("tidytuesdayR")
#install.packages("ggplot2")
library(tidyverse)


#load in data
Ikea<-readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-11-03/ikea.csv')

Ikea%>%
  select(-X1)
#View(Ikea)

Ikea%>%
  count(category, sort=TRUE)
#mutate
Ikea%>%
  count(category, sort=TRUE)%>%
  mutate(category=fct_reorder(category,n))

#seeplot
Ikea%>%
  count(category, sort=TRUE)%>%
  mutate(category=fct_reorder(category,n))%>%
  ggplot(aes(n,category))+
  geom_col()


#so organized but needs labels
Ikea%>%
  count(category, sort=TRUE)%>%
  mutate(category=fct_reorder(category,n))%>%
  ggplot(aes(n,category))+
  geom_col()+
  labs(x="Number of Items",
       y= "Misc. Furniture",
       title="Categories of Ikea Furniture")+
  theme_minimal() ->Ikea_Categories


ggsave("Ikea_Categories.png")

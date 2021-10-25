library(tidyverse)
library(dplyr)

post_offices <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-13/post_offices.csv')

#Compare longevity of post offices from my old hometown Union Co. to Knox Co. 

#filter data to my hometown
Home <- post_offices %>%
  #filter to TN first
  filter(state == "TN") %>%
  #filter to Knox and Union counties
  filter(county1 == c("UNION", "KNOX"))

#make scatter plot
Tennessee <- ggplot(Home)+
  #use established for x and disc. for y
  aes(x = established, y = discontinued)+
  #scatter plot
  geom_point()+
  #facet to county
  facet_wrap(vars(county1))+
  #make std. dev. bars
  geom_smooth(method = "lm")+
  #Title
  labs(title = "P.O. Lifespan")

#print/save
print(Tennessee)
ggsave("Tennessee.png", Tennessee, height = 4, width = 8)

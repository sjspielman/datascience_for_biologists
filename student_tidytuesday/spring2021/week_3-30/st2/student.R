library(tidyverse)
sephora <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-30/sephora.csv')
ulta <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-30/ulta.csv')
allCategories <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-30/allCategories.csv')
allShades <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-30/allShades.csv')
allNumbers <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-30/allNumbers.csv')

 

sephora_plot<-sephora%>%
  ggplot()+
  aes(x=brand,
      fill=brand)+
  geom_bar()+
  theme(axis.text.x=element_text(angle = 90),
        legend.position = "none")+
  labs(x="Brand",
       y="Amount of Products",
       title = "Brands Sold at Sephora")

ggsave("sephora_plot.png",sephora_plot,width = 10,height = 7)

library(tidyverse)
forest <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-06/forest.csv')
forest_area <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-06/forest_area.csv')
brazil_loss <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-06/brazil_loss.csv')
soybean_use <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-06/soybean_use.csv')
vegetable_oil <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-06/vegetable_oil.csv')


forest%>%
  filter(entity=="Austria")%>%
  select(entity,year,net_forest_conversion)%>%
  ggplot()+
  aes(x=year,y=net_forest_conversion,fill=year)+
  geom_col(aes(x=year,y=net_forest_conversion),color="black")+
  labs(x="Year",y="Net Forest Conversion",title = "Net Forest Conversion in Austria From 1990-2015")+
  theme_classic()->plot_austria

ggsave("austria_plot.png",plot_austria,height = 5,width = 7)

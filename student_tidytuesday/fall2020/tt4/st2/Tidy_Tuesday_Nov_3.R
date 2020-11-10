library(tidyverse)
ikea <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-11-03/ikea.csv')

ikea%>%
  select(X1,name,category,sellable_online, price)%>%
  filter(category %in% c("Bar furniture", "Café furniture"))%>%
  mutate(Yes_or_no=if_else(sellable_online=="TRUE", "Yes", "No"))%>%
  ggplot(aes(x=price, fill=Yes_or_no))+
  geom_density(alpha=0.6)+
  scale_fill_brewer(palette = "Dark2", name= "Available Online")+
  labs(title="Price (in Saudi Riyals) of IKEA Bar and Café Furniture", x="Price", y="Density")+
    theme_classic()+
    theme(plot.title = element_text(face = "bold"), legend.text = element_text(size=12), legend.title = element_text(size=13))->Tidy_tuesday_Nov_3.png

ggsave("Tidy_tuesday_Nov_3.png", height = 5, width=7) 
  
  

 

 

 















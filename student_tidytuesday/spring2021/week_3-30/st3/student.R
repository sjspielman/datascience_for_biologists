library(tidyverse)

allCategories <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-30/allCategories.csv')

#view(allCategories)


allCategories%>%
  filter(name %in% c("light","medium", "deep"))%>%
ggplot()+
  aes(x=lightness)+
  geom_dotplot()+
  aes(fill=name)+
  scale_fill_manual(values=c("#724026", "#F1BF91", "#CE8E57"))+
  labs(x="Lightness", title = "Distribution of lightness between Ulta makeup shades")+
  theme_dark()-> tidytues_plot4

print(tidytues_plot4)
ggsave("tidytues_plot4.png", tidytues_plot4, width = 8, height = 4.7)
  

  





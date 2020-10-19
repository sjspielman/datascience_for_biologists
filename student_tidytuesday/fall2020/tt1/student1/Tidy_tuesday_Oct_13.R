library(tidyverse)
datasaurus <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-10-13/datasaurus.csv')


datasaurus%>%
  filter(dataset %in% c("h_lines", "dino", "away", "v_lines", "x_shape"))%>%
  group_by(dataset)%>%
  summarize(means_of_x=mean(x))%>%
  ggplot(aes(x=dataset, y=means_of_x, fill=dataset))+
           geom_col()+
  scale_fill_brewer(palette = "Dark2", name="Dataset")+
  theme_classic()+
  labs(title="Means of X Values For Five Selected Datasets", x= "Dataset", y= "X Means")+
  theme(plot.title = element_text(face="bold"), legend.background = element_rect(color = "black"), axis.text.x = element_text(size=11))->Tidy_Tuesdsy_Oct13.png
ggsave("Tidy_Tuesday_Oct13.png", height = 7, width=6)
  
  






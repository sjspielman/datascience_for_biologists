library(tidyverse)
brazil_loss <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-06/brazil_loss.csv')

brazil_loss%>%
  select(small_scale_clearing, year)%>%
  arrange(small_scale_clearing, year)%>%
  ggplot()+
  aes(y=small_scale_clearing, x=year, fill = year)+
  geom_col()+
  theme(
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    plot.margin = unit(rep(-2,4), "cm"),
    panel.background = element_rect(fill = "lightblue1",
                                    colour = "lightblue1",
                                    size = 0.5, linetype = "solid"),
    panel.grid.major = element_line(size = 2, linetype = 'solid',
                                    colour = "white"), 
    panel.grid.minor = element_line(size = 1.5, linetype = 'solid',
                                    colour = "white")) +
  coord_polar(start = 0)+
  geom_text(data=brazil_loss, aes(x=year, 
                                  y=small_scale_clearing+60000, 
                                  label=year), 
            color="black", 
            fontface="bold", 
            size=8.5, 
            inherit.aes = FALSE)+
  scale_fill_distiller(palette = "RdYlBu", 
                       name = "Year")+
  ylim(-150000,480000)+
  theme(legend.position = "none") -> tidytues_plot5

print(tidytues_plot5)
ggsave("tidytues_plot5.png", tidytues_plot5, width = 14.8, height =14.8)

#Can't seem to add a title, but its an examination of small_scale_clearings over time

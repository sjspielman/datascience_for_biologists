library(tidyverse)
issues <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-23/issues.csv')


issues%>%
  filter(short_name %in% c("co", "di", "ec"))%>%
  select(issue, rcid)%>%
  ggplot()+
  aes(fill=issue, x=rcid, color = issue)+
  geom_density(alpha=0.3)+
  theme_bw()+
  theme(legend.position="bottom")+
  labs(y="Density", fill = "Global Issue:", color="Global Issue:", title = "Distribution of rcid between Global Issues")+
  ylim(0,0.0003) -> tidytues_plot3

print(tidytues_plot3)
ggsave("tidytues_plot3.png", tidytues_plot3, width = 7, height = 5)


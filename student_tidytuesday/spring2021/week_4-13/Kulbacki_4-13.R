
# load library
library(tidyverse)
# load data
post_offices <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-13/post_offices.csv')

# plot from post offices dataset
ggplot(post_offices) + 
  # discontinued on the x axis and duration on the y axis
  aes(x = discontinued, y = duration) +
  # adds points and colors them red based on my choosing
  geom_point(color = "red") +
  # adds a trendline
  geom_smooth(method = "lm", color = "black") +
  # add non-default theme of choice
  theme_minimal() -> post_officescatter
# save figure to file
ggsave("postoffice_figure.png", post_officescatter, width = 6, height = 4)


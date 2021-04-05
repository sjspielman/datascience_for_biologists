# load library
library(tidyverse)
# read in the data
allShades <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-30/allShades.csv')

# plot from the all shades dataset
ggplot(allShades) + 
  # hue value on x axis  
  aes(x = hue) +
  # adds histogram function 
  geom_histogram(bins = 15, color = "black", fill = "black") +
  # adds labels to axis
  labs(x= "hue value among all shades") +
  # add non-default theme of choice
  theme_bw() -> allshades_histogram
# save figure to file
ggsave("makeup_figure.png", allshades_histogram, width = 6, height = 4)


library(tidyverse)
allNumbers <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-30/allNumbers.csv')
# top_10_brands was determined by most makeups produced
top_10_brands <- c("bareMinerals", "SEPHORA COLLECTION", "MAKE UP FOR EVER", "FENTY BEAUTY by Rihanna", "Lancôme", "Clinique", "Smashbox", "KVD Vegan Beauty", "Natasha Denona", "Makeup Revolution" )
# Pipes data into filter
allNumbers %>%
  # Filters data for brand in top_10_brands
  filter(brand %in% top_10_brands) %>%
  # Makes a new column named proportion_light_dark where if lightness is greater than or equal to .5 ...
  mutate(proportion_light_dark = if_else(lightness >= 0.5, 
                                         # Equals Light
                                         "Light", 
                                         # Equals Dark
                                         "Dark")) %>%
  # Selects proportion_light_dark and brand
  select(proportion_light_dark, brand) %>%
  # Groups by brand
  group_by(brand) %>%
  # Counts how many Light and Dark makeups there were
  count(proportion_light_dark) %>%
  # Initiates ggplot()
  ggplot() +
  # Maps x to proportion_light_dark
  aes(x = proportion_light_dark,
      # Maps fill to brand
      fill = brand, 
      # maps y to number of makeups
      y = n) +
  # Makes a bar graph and makes position dodge
  geom_col(position = "dodge", 
           # Outlines the bars in black
           color = "black") +
  # Sets the theme to theme minimal
  theme_minimal() +
  # Labels x axis
  labs(x = "Dark and Light Shades", 
       # Labels y axis
       y = "Number of Makeups",
       # Labels title
       title = "Count of Light and Dark Makeups", 
       # Labels subtitle
       subtitle = "Light = Lightness >= 0.5") +
  # Changes legend title and saves it too makeup_graph
  scale_fill_discrete("Top 10 Brands") -> makeup_graph
# Saves makeup_graph to a file location with a specified height and width
ggsave("makeup_graph.png", makeup_graph, height = 4, width = 9)

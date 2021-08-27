library(tidyverse)
# Downloads dataset
post_offices <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-13/post_offices.csv')
# Defines a variable as a string of abbreviations of North East states
north_east <- c("NJ", "NY", "ME", "MA", "PA", "RI", "VT", "NH")
# Pipes dataset into filter
post_offices %>%
  # Filters the dataset for states with abbreviations in north_east
  filter(state %in% north_east) %>%
  # Groups the data by state
  group_by(state) %>%
  # Makes a new column named old_office, where if established is before or after 1850, a Before will appear, or if not, an After
  summarise(old_office = ifelse(established <= 1850, 
                                "Before", 
                                "After")) %>%
  # Removes NAs
  drop_na() %>%
  # Counts the categories in old_office
  count(old_office) %>%
  # Starts ggplot()
  ggplot() +
  # Maps x to state, y to number of post offices and fill to old_office
  aes(x = state, 
      y = n, 
      fill = old_office) %>%
  # Makes a bar graph, positions the fills next to each other, sets the outline to black, and the alpha as 0.7
  geom_col(position = "dodge", 
           color = "black", 
           alpha = 0.7) +
  # Changes the figure legend title
  scale_fill_discrete("After or Before 1850") +
  # Changes the x axis title, changes the y axis title, and the graph title
  labs(x = "State", 
       y = "Number of Post Offices", 
       title = "Number of Post Offices Founded After and Before 1850 in NE States") +
  # Sets the theme to minimal and saves it to post_office_plot
  theme_minimal() -> post_office_plot
# Sets the name for the save, what it's saving and the figure height and width
ggsave("post_office_plot.png", post_office_plot, height = 4, width = 8)

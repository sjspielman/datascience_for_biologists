# Loads tidyverse
library(tidyverse)
# Reads in the dataset
brazil_loss <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-06/brazil_loss.csv')
# Saves columns as an array with column types
columns <- c("commercial_crops", "flooding_due_to_dams", "natural_disturbances", "selective_logging", "fire", "mining", "other_infrastructure", "roads", "tree_plantations_including_palm", "small_scale_clearing")
# Pipes dataset into pivot_longer()
brazil_loss %>%
  # Sets cols equal to columns, makes the new column name "Type" and values to a column named "Value"
pivot_longer(cols = columns, 
             names_to = "Type", 
             values_to = "Value") %>%
  # Selects the columns, year, Type, and Value
  select(year, 
         Type, 
         Value) %>%
  # Groups by Type
  group_by(Type) %>%
  # Makes a new column, value_total, which is the sum of all values associated with that Type
  mutate(value_total = sum(Value)) %>%
  # Selects Type and value_total
  select(Type,
         value_total) %>%
  # Removes duplicates
  unique() %>%
  # Starts ggplot()
  ggplot() +
  # Maps x to type, y to value_total and fill to Type
  aes(x = Type, 
      y = value_total, 
      fill = Type) +
  # Outlines the columns in black
  geom_col(color = "black") +
  # Changes the legend title to "Reason for Loss"
  scale_fill_discrete("Reason for Loss") +
  # Changes the theme to minimal
  theme_minimal() +
  # Changes x, y and graph title
  labs(x = "Reason for Loss", 
       y = "Loss of Forest", 
       title = "Total Loss of Brazilian Forests 2001-2013") +
  # Removes x axis ticks and x axis text and saves it to brazil_plot
  theme(axis.text.x = element_blank(), 
        axis.ticks.x = element_blank()) -> brazil_plot
# Saves the plot as brazil_plot.png with a specified width and height
ggsave("brazil_plot.png", brazil_plot, width = 8, height = 4)
        
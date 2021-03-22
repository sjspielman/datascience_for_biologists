# Loads Tidyverse
library(tidyverse)
# Loads the dataset
games <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-16/games.csv')
# Sets months_of_year as an array of the months in order
months_of_year <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
# Pipes the dataset into filter
games %>%
  # Filters the data for game names starting with Call of Duty
  filter(str_starts(gamename, "Call of Duty"), 
         # Filters the data for the year being 2020
         year == 2020) %>%
  # Groups the data by month
  group_by(month) %>%
  # Creates a new column named total_Call_of_Duty_players, 
  # which is equal to the sum of avg
  summarise(total_Call_of_Duty_players = sum(avg)) %>%
  # Initiates ggplot
  ggplot() + 
  # Maps the x axis to month, but places the months in order cronologically, 
  # not alphabetically
  aes(x = fct_relevel(month, months_of_year), 
      # Maps y to the new column total_Call_of_Duty_players 
      y = total_Call_of_Duty_players, 
      # Maps the fill equal to the months in cronological order
      fill = fct_relevel(month, months_of_year)) +
  # Initiates geom_col, and makes the outlining of the columns black
  geom_col(color = "black", 
           # Sets the width of the outlining of the columns as 1
           size = 1) +
  # Sets the theme to classic
  theme_classic() +
  # Sets the x axis text size to 8
  theme(axis.text.x = element_text(size = 8)) +
  # Changes the legend name to Month of 2020
  scale_fill_discrete("Month of 2020") +
  # Sets the x axis title as Month of 2020
  labs(x = "Month of 2020", 
       # Sets the y axis title as Avg. # of Call of Duty Players
       y = "Avg. # of Call of Duty Players", 
       # Sets the title as Avg. # of People Playing a Call of Duty Game at One Time During 2020
       # Sets the plot equal to Cod_graph
       title = "Avg. # of People Playing a Call of Duty Game at One Time During 2020") -> Cod_graph
# Saves Cod_graph to a file location with a specified height and width
ggsave("Cod_graph.png", Cod_graph, height = 4, width = 9)  
 
  
  

  
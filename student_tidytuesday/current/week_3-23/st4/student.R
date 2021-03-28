library(tidyverse)
# Reads in roll_calls
roll_calls <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-23/roll_calls.csv')
# Pipes roll_calls into filter()
roll_calls %>%
  # Filters data for short starting with DISARMAMENT, and where session is greater than or equal to 39
  filter(str_starts(short, "DISARMAMENT"), session >= 39) %>% 
  # Selects columns session and short
  select(session, short) %>%
  # Makes a new column named contains_disarmament, which shows if short started with Disarmament
  mutate(contains_disarmament = str_starts(short, "DISARMAMENT")) %>%
  # Makes a new column replacing the old one where the TRUEs are replaced with the number 1
  mutate(contains_disarmament = if_else(contains_disarmament == "TRUE", 1,0)) %>%
  # Selects contains_disarmament and session
  select(contains_disarmament, session) %>%
  # Groups the data by session
  group_by(session) %>%
  # Counts the number of times contains_disarmaments occurs per session number
  count(contains_disarmament) %>%
  # Starts ggplot()
  ggplot() +
  # Maps x to session and y to n
  aes(x = session, y = n) +
  # Makes a bar graph where the fill is darkred and the color is black
  geom_col(fill = "darkred", color = "black") +
  # Labels the x and y axis', along with the title
  labs(x = "Session Number", y = "Number of Times", title = "Number of Times Disarmament was Mentioned per Session") +
  # Applies theme_minimal and sets this plot equal to mentions_disarmament
  theme_minimal() -> mentions_disarmament
# Saves the plot mentions disarmament to a specific file location with a specific height and width
ggsave("Mentions_disarmament.png", mentions_disarmament, height = 3.5, width = 6) 


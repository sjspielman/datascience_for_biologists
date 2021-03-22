# load tidyverse library
library(tidyverse)

# read in tidytuesday data
games <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-16/games.csv')

target_years <- c(2018, 2019, 2020) # define variable
games %>% # pipe in dataset
  select(year, avg, gamename) %>% # select columns of interest
  filter((str_detect(gamename, "Call of Duty")), # filter for Call of Duty games
         year == target_years) %>% # filter for target years
  group_by(gamename, year) %>% # group by game name and year
  mutate(mean_avg = mean(avg)) %>% # create column averaging the average number of people playing a particular game at one time that year
  select(year, gamename, mean_avg) %>% # select columns of interest
  distinct() %>% # only keep distinct rows
  ungroup() -> games_subset # ungroup and define variable

tidyplot <- games_subset %>% # pipe in data subset and define variable
  ggplot() + # add ggplot
  aes(x = gamename, # add variable to x-axis
      y = mean_avg, # add variable to y-axis
      fill = gamename) + # map fill to game name 
  geom_col(color = "black", # add barplot and specify color 
           size = 0.4) + # specify color size
  facet_wrap(vars(year)) + # facet plot across years
  theme_dark() + # add dark theme
  scale_x_discrete(labels = NULL, # remove x-axis labels
                   breaks = NULL) + # remove x-axis tick marks
  scale_fill_discrete(name = "Game Name") + # change legend title
  theme(legend.text = element_text(size = 6), # specify legend text size
        legend.title = element_text(size = 7), # specify legend title size
        legend.key.height = unit(.3, 'cm'), # specify legend key height
        legend.key.width = unit(.3, 'cm'), # specify legend key width
        axis.title = element_text(size = 7)) + # specify axes title sizes
  labs(x = "Game", # change x-axis label
       y = "Individuals Playing at One Time (mean)") # change y-axis label

ggsave("tidytuesday_figure.png", tidyplot, # save tidyplot
       width = 5, # specify width
       height = 2.5) # specify height
  
  

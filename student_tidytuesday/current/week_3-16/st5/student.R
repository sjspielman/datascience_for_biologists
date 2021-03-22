library(tidyverse)
library(lubridate)

steam <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-16/games.csv')

#Narrow things down
Kyle_favorites <- c("Overcooked", "Bastion", "Call of Duty: World at War", "Fallout 3", "FEZ", "Portal", "LIMBO", "Octodad: Dadliest Catch", "SimCity 4 Deluxe")
Mom_favorites <- c("Portal", "Portal 2", "Half-Life", "Half-Life 2")

##Kyle's Plot-------------------------------------------------------------------

#Wrangle data to work with
Kyle2 <- steam %>%
  filter(gamename %in% c(Kyle_favorites)) %>%
  filter(year == "2021")

#Plot data
Kyle_games <- ggplot(Kyle2)+
  aes(y = reorder(gamename, avg), x = avg, fill = gamename)+
  geom_col()+
  labs(x = "Average Number of Players In One Month", y = "Game", title = "2021 Avg. Players")+
  scale_fill_brewer(palette = "Paired")+
  theme_dark()+
  theme(legend.position = "none")
  

#Print and save data
print(Kyle_games)
ggsave("Kyle_games.png", Kyle_games, height = 3, width = 8)

##Mom's Plot-------------------------------------------------------------------Mom's plot is not working out, let's submit the top one please. Thank you. I want to come back to this later on. 

#Wrangling data
Mom1 <- steam %>%
  filter(gamename %in% c(Mom_favorites)) %>%
  filter(year == "2021")

#Make plot
Mom2 <- ggplot(Mom1)+
  aes(x = avg, y = year, color = gamename)+
  geom_point()


#print and save
print(Mom2)
ggsave("Mom_games.png", Mom2, height = 4, width = 6)







  
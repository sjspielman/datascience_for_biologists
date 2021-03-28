## TIDY TUESDAY 3-23 ##

## LOAD DATA AND LIBRARIES

library(tidyverse)

unvotes <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-23/unvotes.csv')


# start data wrangling pipeline
unvotes %>% 
  # group by vote
  group_by(vote) %>%
  # rename vote choices
  mutate(vote = recode(vote, "abstain" = "Abstained", "no" = "No", "yes" = "Yes")) %>%
  # pipe ggplot() 
  ggplot() + 
  # add aes with x ordered by frequcency and fill mapped to vote 
  aes(x = fct_infreq(vote), fill = vote) + 
  # add barplot 
  geom_bar() +
  # add theme 
  theme_minimal() +
  # add theme customizations. remove legend, edit text sizes for legibility 
  theme(legend.position = "none",
        axis.text.x = element_text(size = 9),
        axis.title=element_text(size=11)) + 
  # add labels
  labs(x = "Vote", y = "Count") -> tidy_tues3

# save plot w/ specified dimensions 
ggsave("plot_3-23.png", tidy_tues3, width = 4, height = 3.5)
  
            
library(tidyverse)  

movies <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/movies.csv')



# movies %>%
# count(rated) %>%
#  distinct
  
  
ratings <- c("PG", "PG-13", "R") 
colors <- c("red", "dodgerblue4")

# Use movies dataset.
movies %>%
# Subset movies to only certain ratings and from "USA".
  filter(rated %in% ratings, country == "USA") %>%
# Only keep the metascore, rated, and binary columns.
  select(metascore, rated, binary) -> usa_movies

# Use usa_movies dataset and pipe directly into ggplot.
usa_movies %>% 
  ggplot(aes(x = rated,
             y = metascore,
             fill = binary)) +
  labs(x = "Rating",
       y = "Metascore") + 
# Change theme to classic.
  theme_classic() + 
  theme(axis.text = element_text(size = rel(0.9)), # both axes 
        axis.text.x = element_text(color = "gray0"), # only the x!
        axis.text.y = element_text(color = "gray0")) +  # only the y!
# Change the axis thickness and color.  
  theme(axis.line = element_line(size = rel(2), color = "dodgerblue4")) + 
# Change the background color of the plot
  theme(plot.background = element_rect(color = "red",
                                       size = 1.5)) + 
# Manually change the color of the legends.
  scale_fill_manual(values=c(colors)) +
# create boxplot with a "gray0" outline.
  geom_boxplot(color = "gray0") -> usa_movies_plot
print(usa_movies_plot)
# Save plot.
ggsave("usa_movies_plot.png", usa_movies_plot, width = 6, height = 4)

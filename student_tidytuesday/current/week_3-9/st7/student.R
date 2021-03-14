
library(tidyverse)
raw_bechdel <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/raw_bechdel.csv')
movies <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/movies.csv')

#View(movies)
#View(raw_bechdel)


movie_data_plot<-ggplot(movies)+
  aes(x=rated)+
  geom_bar(color="Black",fill="deeppink2")+
  labs(x="Movie Ratings",y="Number of Movies")+
  theme_light()
ggsave("Movie_Figure.png",movie_data_plot,width = 7,height = 5)

#print(movie_data_plot)


library(tidyverse)
mobile <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-11-10/mobile.csv')

mobile %>%
  filter(entity == "Sweden") %>%
  #filter(year == "1990:2000")%>%
ggplot(aes(x = year, y = mobile_subs)) +
  geom_point() +
labs(x = "Year", y = "Number of Mobile Subscriptions (Per 100 People)", title = "Plot of Mobile Subscriptions in Sweden")
ggsave("mobile_figure.png", width = 6, height = 4)

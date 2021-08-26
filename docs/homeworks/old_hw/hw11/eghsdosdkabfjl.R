library(tidyverse)


msleep %>%
  group_by(vore) %>%
  summarize(mean_sleep = mean(sleep_total))

ggplot(msleep, aes(x = vore, y = sleep_total)) + 
  stat_summary(fun = "mean", geom = "col") + 
  stat_summary(fun = "mean", geom = "point") 
  

msleep %>%
  filter(vore == "insecti") %>%
  ggplot(aes(x = name, y = sleep_total)) + 
    geom_col()
    geom_bar(stat = "identity")







dur <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-20/netflix_titles.csv') %>% select(duration)

dur %>%
  tidyr::separate(duration, into=c("time", "units"), sep = " ") %>%
  filter(units == "min") %>%
  mutate(time = as.numeric(time))


dur %>%
  filter(str_detect(duration, "min")) %>%
  mutate(time = str_replace(duration, " min", "")) %>%
  mutate(time = as.numeric(time))



tibble(y = "A", x = "1??2??3") %>% separate_rows(x)

tibble(x= "1,2,3,4") %>% separate(x, into=c("a", "b", "c", "d"))
# unite()
# separate()
# separate_rows()
# extract()
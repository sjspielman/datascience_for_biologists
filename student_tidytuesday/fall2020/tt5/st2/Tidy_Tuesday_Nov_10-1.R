library(tidyverse)
library(ggthemes)


mobile <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-11-10/mobile.csv')
landline <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-11-10/landline.csv')

mobile%>%
  mutate(phone_type="mobile")-> new_mobile

landline%>%
  mutate(phone_type="landline")->new_landline

bind_rows(new_mobile, new_landline)->New_dataset

New_dataset%>%
  replace_na(list(landline_subs=0))%>%
  replace_na(list(mobile_subs=0))->Final_dataset

Final_dataset%>%
  mutate(total_subs=landline_subs+mobile_subs)->Final_daataset_2

Final_daataset_2%>%
  filter(entity %in% c("United States", "Japan"))%>%
  select(entity, total_subs,phone_type,year)%>%
  rename(Subscriptions=total_subs)%>%
  ggplot(aes(year->x, Subscriptions->y))+
  geom_line(aes(color=entity))+
  labs(title="Number of Mobile and Landline Phone Subscriptions 
  in Japan and the US per 100 People Since 1990")+
  facet_wrap(vars(phone_type))->P
P + theme_wsj()+ 
  scale_colour_wsj("colors6", name="Country")+
  theme(legend.text = element_text(size = 14), strip.text = element_text(size=14, face = "bold"))->Plot_Nov_10.png

  ggsave("Plot_Nov_10.png", width = 14, height = 8)
          
 





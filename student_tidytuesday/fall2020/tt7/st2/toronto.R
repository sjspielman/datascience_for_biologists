#Name: Rachael Wilson
###############################################################################
#Load in library
library(tidyverse)
###############################################################################
#Load in the data sets
shelters <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-12-01/shelters.csv')
###############################
#Which of the two highest capacity organizations occupy the most women. 
shelters%>%
  select(organization_name, capacity)%>%
  group_by(organization_name)%>%
  summarize(highest_capacity_organizations=sum(capacity))%>%
  arrange(desc(highest_capacity_organizations))
# I found out the two organization names that have the highest capacity shelters. Homes First Society and Dixon Hall 
singles<-c("Women", "Men")
top_shelters<-c("Homes First Society", "Dixon Hall" )
shelters%>%
  filter(sector%in%singles, organization_name%in%top_shelters)%>%
  select(organization_name,sector,occupancy)%>%
  ggplot(aes(x=organization_name, fill=sector))+
  geom_bar()+
  scale_fill_brewer(palette = "Paired", name="Sector")+
  labs(x="Organization", y="Occupancy", title="Occupancy of Men and Women in Toronto Organizations")-> Toronto_shelter_plot

ggsave("toronto_shelters.png", Toronto_shelter_plot, height= 5, width= 6)

#It seems that Homes First Society's shelters occupy more women than Dixon Hall. 


  
  

  
  

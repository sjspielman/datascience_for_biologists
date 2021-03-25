final_kenya %>%
  select(County, NumberOfHouseholds, contains("farming")) %>%
  filter(farming_type == "Avocado") %>%
  distinct() %>%
  mutate(percent_households = farming_n_households/NumberOfHouseholds)%>%
  select(-NumberOfHouseholds, -contains("farming")) %>%
  arrange(desc(percent_households)) %>%
  slice(1:10) %>%
  ggplot() + 
    geom_point(aes(x = County, y = percent_households)) +
    geom_segment(aes(
      x = County, 
      y = 0, 
      xend = County,
      yend = percent_households
    ))

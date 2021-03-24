crops %>%
  rename(County = SubCounty) %>%
  mutate(County = str_to_title(County)) %>%
  filter(County != "Kenya") -> crops_clean_county 

gender %>%
  filter(County != "Total") %>%
  mutate(County = if_else(County == "Nairobi City", 
                          "Nairobi", 
                          County)) -> gender_clean_county

households %>%
  filter(County != "Kenya") %>%
  mutate(County = if_else(County == "NairobiCity", 
                          "Nairobi", 
                          County)) %>%
  mutate(County = str_replace(County, "([a-z])([A-Z])", "\\1 \\2")) -> households_clean_county

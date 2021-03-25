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

crops_clean_county %>%
  pivot_longer(Farming:last_col(),
               names_to = "farming_type", 
               values_to = "farming_n_households") %>%
  replace_na(list(farming_n_households = 0)) -> crops_clean_county_tidy

gender_clean_county %>%
  select(-Total) %>%
  pivot_longer(Male:Intersex, 
               names_to = "sex", 
               values_to = "quantity_sex") -> gender_clean_county_tidy

full_join(households_clean_county, crops_clean_county_tidy) %>%
  full_join(gender_clean_county_tidy) -> final_kenya
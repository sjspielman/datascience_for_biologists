
gender <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-19/gender.csv')
crops <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-19/crops.csv')
households <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-19/households.csv')

#Each data frame has a column representing `County`. We want to make sure each of these columns has the same name, *and* contains values represented in the same manner. 
#My (our) approach: Get the `household` and `crops` county columns to match the `gender` county column. 

#Tasks to accomplish to achieve this goal:
#They all also have a county meant as a "total count"...
####In `household`, this is labeled as `Kenya`. 
####In `gender`, this is labeled as `Total`. 
####In `crops`, this is labeled as `KENYA`. 

#`gender` and `households` records Nairobi as `Nairobi city`, `nairobicity`. make it nairobi.
#`household` does not have spaces 
#Change `Khat (Miraa)` columns to `Khat` since working with parentheses as column titles is _the worst._ When referring to these types of columns, you need to surround the column in backticks or quotes, otherwise it will hate you. 

#Use this code to add a space every County in households where spaces should be. This code uses something called [*regular expressions*](https://doc.lagout.org/programmation/Regular%20Expressions/Introducing%20Regular%20Expressions_%20Unraveling%20Regular%20Expressions%2C%20Step-by-Step%20%5BFitzgerald%202012-08-03%5D.pdf) to find and replace text based on *a pattern*: Every time there is the pattern "lowercaseletter-uppercaseletter", replace with "lowercaseletter-space-uppercaseletter" (eg, "TransNzoia" --> "Trans Nzoia").AKA regex, knowing this is an absolutely key component of working with data using computational tools.  


households %>% filter(County != "Kenya") %>%
  mutate(County = ifelse(County == "NairobiCity", "Nairobi", County)) -> households_remove_total

gender %>% filter(County != "Kenya", County != "Total") %>%
  mutate(County = ifelse(County == "Nairobi City", "Nairobi", County))-> gender_remove_total

crops %>% filter(SubCounty != "KENYA") %>%
  rename(Khat = `Khat (Miraa)`)-> crops_remove_total



households_remove_total %>%
  mutate(County = str_replace(County, "([a-z])([A-Z])", "\\1 \\2")) -> households_clean_county

crops_remove_total %>% 
  mutate(County = str_to_title(SubCounty)) %>% 
  select(-SubCounty) %>%
  select(County, everything()) -> crops_clean_county

#And darn wouldn't you know it, this bitch is not tidy. Let's tidy it. And see all those NAs? They mean 0.

crops_clean_county %>%
  pivot_longer(Farming:Khat, names_to = "crop", values_to = "number_of_households") %>%
  replace_na(list(number_of_households = 0)) -> crops_tidy

#We also want to make sure our columns are clearly understood in the final version.
# probably need some renames here!!!

full_join(crops_tidy, households_clean_county) %>%
  full_join(gender_remove_total) -> joined_kenya


joined_kenya %>%
  filter(crop == "Avocado") %>%
  mutate(percent = number_of_households / NumberOfHouseholds) %>%
  select(percent, everything()) %>%
  arrange(-percent) %>%
  slice(1:10) %>%
  mutate(x = fct_reorder(County, percent, .desc=T)) %>%
  ggplot() + 
  geom_point(aes(x = x, y = percent)) + 
  geom_segment(aes(x = x, xend = x, yend = percent), y = 0) 


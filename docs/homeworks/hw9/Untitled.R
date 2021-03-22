
+ Each data frame has a column representing `County`. We want to make sure each of these columns has the same name, *and* contains values represented in the same manner. 
+ My (our) approach: Get the `household` and `crops` county columns to match the `gender` county column. 

+ Tasks to accomplish to achieve this goal:
  + They all also have a county meant as a "total count"...
+ In `household`, this is labeled as `Kenya`. 
+ In `gender`, this is labeled as `Total`. 
+ In `crops`, this is labeled as `KENYA`. 
+ `gender` and `households` records Nairobi as `Nairobi city`, `nairobicity`. make it nairobi.
+ `household` does not have spaces 
+ Change `Khat (Miraa)` columns to `Khat` since working with parentheses as column titles is _the worst._ When referring to these types of columns, you need to surround the column in backticks or quotes, otherwise it will hate you. 

Use this code to add a space every County in households where spaces should be. This code uses something called [*regular expressions*](https://doc.lagout.org/programmation/Regular%20Expressions/Introducing%20Regular%20Expressions_%20Unraveling%20Regular%20Expressions%2C%20Step-by-Step%20%5BFitzgerald%202012-08-03%5D.pdf) to find and replace text based on *a pattern*: Every time there is the pattern "lowercaseletter-uppercaseletter", replace with "lowercaseletter-space-uppercaseletter" (eg, "TransNzoia" --> "Trans Nzoia").

> AKA regex, knowing this is an absolutely key component of working with data using computational tools.  

```{r q3.1}

households %>% filter(County != "Kenya") %>%
  mutate(County = ifelse(County == "NairobiCity", "Nairobi", County))-> households_remove_total

gender %>% filter(County != "Kenya", County != "Total") %>%
  mutate(County = ifelse(County == "Nairobi City", "Nairobi", County))-> gender_remove_total

crops %>% filter(SubCounty != "KENYA") %>%
  rename(Khat = `Khat (Miraa)`)-> crops_remove_total

households_remove_total %>%
  mutate(County = str_replace(County, "([a-z])([A-Z])", "\\1 \\2")) -> households_clean_county
```

Second, you will need to modify the `County` column in crops which is currently all caps. We can use the `str_to_title()` function from the core `tidyverse` package `stringr` for this. See this demo to learn how and apply, saving the final tibble into `crops_clean_county`. 

```{r q1_2}
crops_remove_total %>% mutate(County = str_to_title(SubCounty)) %>% select(-SubCounty) %>% select(County, everything()) -> crops_clean_county
```

And darn wouldn't you know it, this bitch is not tidy. Let's tidy it. And see all those NAs? They mean 0.
```{r pending}
crops_clean_county %>%
  pivot_longer(Farming:Khat, names_to = "crop", values_to = "number_of_households") %>%
  replace_na(list(number_of_households = 0)) -> crops_tidy

```
We also want to make sure our columns are clearly understood in the final version. Everything is pretty interpretable except `Total` which came from `gender`. Rename this to `total_
```{r q1_3}
full_join(crops_tidy, households_clean_county) %>%
  full_join(gender_remove_total) -> joined_kenya

joined_kenya
```

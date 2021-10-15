library(tidyverse)


## Wednesday 10/13/21 -----------------------------------------


# filter: subset rows based on T/F
# filter is a dplyr verb
# Keep only rows where it is TRUE that vore == "omni"
msleep %>%
  filter(vore == "omni")


# Results in 0 rows since nothing was named herbivores in this column.
# This "bug" is not an error, but it doesn't accomplish our goal of subsetting to ***"herbi"***
msleep %>%
  filter(vore == "herbivores")

# keep those that weigh more than 1000 kg
msleep %>%
  filter(bodywt > 1000) %>%
  # pipe into tally (or nrow()): how many rows resulted from the filtering?
  tally()

# Keep only herbivores that are awake more than 12 hours per day
msleep %>%
  filter(vore == "herbi", awake > 12) # separating by a comma is like "and". All conditions need to be TRUE

# Equivalent to above - can provide in two lines if you prefer!
msleep %>%
  filter(vore == "herbi") %>%
  filter(awake > 12)


# Keep ONLY herbivores and omnivores - BUG!!! No rows are kept because it's NEVER POSSIBLE for a row to be BOTH "herbi" and "omni"
msleep %>%
  filter(vore == "herbi", vore == "omni")

# Recall the %in% logical operator! TRUE if the value is IN the array (this is FALSE)
"elephant" %in% c("dog", "cat", "bear")

# Here's how you can filter to call all herbivores or omnivores
msleep %>%
  filter(vore %in% c("herbi", "omni"))

# This strategy also vores for keeping both herbi and omni
msleep %>%
  filter(vore == "herbi" | vore == "omni") 


# NO!!!!!!!!!!!!!!!!!!!!!!!!!!!! THIS WILL FEEL LIKE IT WORKS BUT IT WON'T WORK!!!
msleep %>%
  filter(vore == c("herbi", "omni"))


### Keep only Primates (order) that weigh less (<) than 25 kg
## How many are there?
msleep %>%
  filter(order == "Primates", bodywt < 25) %>%
  nrow()

# keep bodywt > 10 and < 30
msleep %>%
  filter(bodywt > 10, bodywt < 30)

# We can pipe into ggplot!! Here we wrangle and directly pipe into a ggplot
msleep %>%
  filter(bodywt < 25) %>%
  drop_na(vore) %>% 
  ggplot() + 
    aes(x = vore, y = awake) + 
    geom_boxplot()

# The dplyr verb select is used to subset columns. This keeps name and vore only
msleep %>%
  select(name, vore)

# When used with a minus sign, select will REMOVE the given column(s)
msleep %>% 
  select(-name)


## Thursday 10/14/21 -----------------------------------

# filter()
# select()
# drop_na()

# mutate() creates new columns aka VARIABLES
msleep %>%
  mutate(type_of_animal = "mammals") %>%
  # use select only to check that my mutate() worked as planned
  select(type_of_animal)


msleep %>%
  # create two new columns in the same mutate command
  mutate(brainwt_g = brainwt * 1000,
         bodywt_g  = bodywt * 1000) %>%
  # pipe into view as a temporary interactive way to check if it worked!
  # remember, view() is not for long term and in a homework should be commented out.
  View()

# For example, this is totally fine to submit on a HW. See how the %>% View() is commented out?
msleep %>%
  # create two new columns in the same mutate command
  mutate(brainwt_g = brainwt * 1000,
         bodywt_g  = bodywt * 1000)  #%>% 
  #View()

# What if I want to TOTALLY CHANGE brainwt to be g?
msleep %>%
  mutate(brainwt = brainwt * 1000) %>% View()

# FINAL EXAMPLE!!!
msleep %>%
  mutate(brainwt_g = brainwt * 1000,
         bodywt_g  = bodywt * 1000) %>%
  # Now, remove the original brainwt and bodywt columns
  select(-brainwt, -bodywt) -> msleep2

library(tidyverse)


# dplyr Functions:

#filter() for subsetting rows
#select() for keeping/removing columns
#mutate() for making NEW columns
#drop_na() for removing NAs
#tally() for counting rows



# Explore -----------------
str(msleep)

glimpse(msleep) # prettier str()
# Set 1 ----------------

# Subsetting rows with filter() ---------------
 
# Miscellaneous demos 

msleep %>%
  filter(bodywt >10) %>%
  pull(bodywt)


# if_else() / ifelse()

if_else(10 < 5, "yes", "no")


# sleep_total 
sleep_threshold <- 20
msleep %>%
  mutate(sleeps_a_lot = if_else(sleep_total > sleep_threshold, 
                                "yes", 
                                "no") 
         ) %>%
  select(sleep_total, sleeps_a_lot)

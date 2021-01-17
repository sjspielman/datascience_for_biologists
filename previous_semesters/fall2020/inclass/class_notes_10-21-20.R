## Notes for 10/21/20 ##

# Load libraries --------------------------
library(tidyverse)

# This line of code reveals datasets that come with the tidyr package
# You may want to use them for more practice in conjunction with the linked resources
# data(package = "tidyr")


## Example to start:
# For three extremely real and definitely not entirely made-up countries, how many people live in the north vs south?
tribble(~country, ~north, ~south,
        "A",         100,     125,
        "B",         500,     150,
        "C",         200,     450) -> pop_ns

# Identify variables and associated values?
# Variables: country, region, and population
# Values: country is A, B, or C
# Values: region is north or south
# Values: population is all the numbers in the table

# The tidy version would therefore look like:
tribble(~country, ~region, ~population,
        "A",      "north",    100,
        "A",      "south",    125,
        "B",      "north",    500,
        "B",      "south",    150,
        "C",      "north",    200,
        "C",      "south",    450) -> pop_ns_tidy




## What are the functions?

# pivot_wider() --> Make a data frame wider (generally tidy -> messy)
#### *Needs* TWO arguments (but has more): names_from and values_from

# pivot_longer() --> Make a data frame longer (generally messy -> tidy)
#### *Needs* ONE argument (but has more): a selection of columns to pivot
#### *Recommended* arguments: names_to and values_to (but can also use rename as the next step instead if you prefer)

## AVOID spread() and gather() !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
## THEY ARE THE OLD VERSIONS OF THESE FUNCTIONS. THEY ARE WORSE TO USE. 
## USE THEM AT YOUR OWN PERIL. I DO NOT RECOMMENDED IT.
## spread() is the old pivot_wider()
## gather() is the old pivot_longer()


# pop_ns --> pop_ns_tidy
# wide ----> long  : pivot_longer()

#### what columns should be pivoted?
# columns north/south turned into values

# basic long pivot
pop_ns %>%
        pivot_longer(north:south)

# long pivot with customized new column names
pop_ns %>%
        pivot_longer(north:south) %>%
        rename(region = name, population = value)

# long pivot with customized new name RIGHT AWAY!
pop_ns %>%
        pivot_longer(north:south,
                     names_to = "region",  # north/south go to a new column region
                     values_to = "population") # pop numbers go to new column population

## pop_ns_tidy --> pop_ns    

pop_ns_tidy %>%
        pivot_wider(names_from = "region",  # values in region will be new COLUMNS!
                    values_from = "population") # those new columns get the "population" values



## DATA -----------------------------------------------------------
## Researchers measured oxygen usage for 10 seals (numbered 1-10) during a feeding dive (dive to eat) and a nonfeeding dive. Researchers are testing the hypothesis that seals use more oxygen in feeding vs non-feeding dives.

# Two differently-formatted versions:
seals_long <- read_csv("seals.csv")    # "long" version
seals_wide <- read_csv("seals2.csv")  # "wide" version


## Question: Which dataset is technically "tidy"? seals_long


## TASKS --------------------------------------------------------

# Some tasks are relatively easy with BOTH versions of seals, and some are only easy with one of the versions.

# 1. Plot a histogram of all nonfeeding dive oxygen usages.
ggplot(seals_wide, aes(x = Oxygen_use_nonfeeding)) + 
        geom_histogram()

seals_long %>%
        filter(dive_type == "Oxygen_use_nonfeeding") %>%
        ggplot(aes(x = oxygen_usage)) + 
        geom_histogram()

# punchline: relatively easy with both datasets, but easier with seals_wide since data is already in a column

# 2. Plot a scatterplot showing the relationship between feeding and nonfeeding oxygen usage. Each dot is a single seal.

ggplot(seals_wide, aes(x = Oxygen_use_nonfeeding, y = Oxygen_use_feeding)) +
        geom_point() + 
        geom_abline() # default, slope=1 intercept=0 --> y=x
# y = mx+b
# y = ax + b
# NOT A HARD PLOT TO MAKE

# with seals_long, this plot is very hard/impossible!! We would need to pivot
ggplot(seals_long, aes(x = dive_type, y = oxygen_usage)) + 
        geom_jitter() # THIS IS NOT A SCATTERPLOT



# 3. Calculate the mean oxygen usage from feeding dives. Result should be a tibble with one column (mean_o2) and one row for the single value.

# isolate only feeding values
# get their mean

# mean_o2
# ??
# task is DOABLE with seals_wide!!!!
seals_wide %>% 
        summarize(mean_o2 = mean(Oxygen_use_feeding))

# task is DOABLE with seals_long!!!!
# but easier wide
seals_long %>%
        filter(dive_type == "Oxygen_use_feeding") %>%
        summarize(mean_o2 = mean(oxygen_usage))




# 4. What is the ratio of nonfeeding:feeding oxygen use per seal? Result should be a tibble with columns `seal` (1-10) and `ratio`, and 10 rows (1 per seal).

seals_wide %>%
        mutate(ratio = Oxygen_use_nonfeeding/Oxygen_use_feeding)

seals_long # NEED TO PIVOT THIS IN ORDER TO SOLVE



# Pivoting ----------------------------------------------


# Can we convert seals_long to seals_wide?
#names_from and values_from

seals_long %>%
        pivot_wider(names_from = "dive_type",
                    values_from = "oxygen_usage")

# so why in this case would you use Oxygen_use_nonfeeding:Oxygen_use_feeding instead of names_to
seals_wide %>%
        pivot_longer(Oxygen_use_nonfeeding:Oxygen_use_feeding) %>%
        rename(dive_type = name, 
               oxygen_usage = value)


# Can we convert seals_wide to seals_long?

# More fun: Can you convert seals2 to seals3? 
# Hint: You'll need to use `if_else()` and `mutate()`! 
# Hint 2: If you mutate an existing column, it changes the column. For example:
#iris %>% mutate(Sepal.Length = Sepal.Length*100)

# MORE FUN: Can you convert seals to seals3?



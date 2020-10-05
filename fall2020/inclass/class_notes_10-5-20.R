# TODAY WE HAD OUR FIRST EXPOSURE TO:
# %>%
# filter
# mutate
# arrange
# select
# rename
# distinct



library(dplyr)
library(palmerpenguins)
#dplyr::filter # not ambiguous! use the dplyr version of filter
#filter # ambiguous 

View(penguins)

# functions, verbs 

# function(DATAFRAME, .....)

# filter(): subset rows based on logical comparisons. TRUE/FALSE
filter(penguins, species == "Adelie")
filter(penguins, bill_length_mm > 40) # bill_length_mm is greater than 40

# keep only large bills and adelie penguins - BOTH conditions must be true
filter(penguins, bill_length_mm > 40, species == "Adelie") 

# pipe symbol  %>%     NOT:  $>$  >%>
# pipe is in dplyr

log(5)
5 %>% log() # send 5 into log as its first argument

log(100, 10) # 2, log 100 in base 10
100 %>% log(10)

filter(penguins, species == "Adelie")

# pipelines
penguins %>% 
  filter(species == "Adelie") %>%
  filter(bill_length_mm > 40)

filter(filter(penguins, species == "Adelie"), bill_length_mm > 40)

penguins %>% 
  filter(species == "Adelie", bill_length_mm > 40)

## mutate: adds new columns

penguins %>%
  mutate(new_column = 5) -> penguins1 # new column with all rows as 5

# saving a new dataset called penguins_log
penguins %>% 
  mutate(bill_length_mm_log = log(bill_length_mm)) -> penguins2

penguins_log <- penguins %>% 
  mutate(bill_length_mm_log = log(bill_length_mm)) -> penguins3

penguins %>%
  arrange(island)

# default ascending
penguins %>%
  arrange(bill_length_mm)

# descending order:
penguins %>%
  arrange(desc(bill_length_mm))


# select: selects to keep/remove or reorder columns
penguins %>%
  select(species, island) # only keep species and island

# get rid of columns
penguins %>%
  select(-species, -island) # keep all except species/island

# everything() helps to reorder columns
penguins %>%
  select(sex, everything()) # sex first, then everything else

# rename: changes names of columns
# newname = oldname
penguins %>%
  rename(penguin_species = species)

# distinct removes duplicate rows
penguins %>%
  distinct()




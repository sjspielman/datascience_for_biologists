# Class notes 10/20/21 ----------------

library(tidyverse)

# select()
# filter()
# mutate()
# drop_na()
# tally()
# count() # HOW MANY OF A CATEGORICAL VARIABLE

msleep %>%
  count(vore, name = "number_of_mammals") # vore is a categorical variable


# Next up: -----------------------------
# rename()    # changes the name of a column
# arrange()   # arranges rows ("sorts")
# distinct()  # keep only unique aka distinct rows

# rename() ----------------------
# rename(newname = oldname)

msleep %>%
  rename(body_weight = bodywt,
         brain_weight = brainwt) %>% View()

# NO! wrong order
#msleep %>%
#  rename(bodywt = body_weight) 

# arrange() ------------------

# Default: ascending order
msleep %>% 
  arrange(order) %>% View()

# Descending order
msleep %>% 
  arrange(desc(order)) %>% View()

# Default: ascending order
msleep %>%
  arrange(awake) %>% View()

# Descending order
msleep %>%
  arrange(desc(awake)) %>% View()

# distinct() --------------

msleep %>%
  distinct() %>% nrow()

# All unique combinations of vore and conservation
# on the homework!
msleep %>%
  select(vore, conservation) %>%
  distinct() %>%
  drop_na()



#Modify the pipeline below to only keep distinct rows at the end. First, engage with to understand which duplicate rows you expect will be removed. Finally, you also remove all combinations in the result with NA?
 msleep %>%
  select(vore, conservation) %>%
   distinct() %>% 
   drop_na()
 
 
# Dropping NAs or not????
 # 0.2815814 is the mean of brainwt
 
msleep %>%
  drop_na(brainwt) %>%
  mutate(brainwt_mean = mean(brainwt)) %>%
  select(brainwt, brainwt_mean)
 
# brainwt relative to overall mean?
msleep %>%
  drop_na(brainwt) %>%
  mutate(brainwt_mean = mean(brainwt),
         relative_brain = brainwt/brainwt_mean) %>%
  select(brainwt, brainwt_mean, relative_brain)


msleep %>%
  drop_na(brainwt) %>%
  mutate(relative_brain = brainwt/mean(brainwt)) %>%
  select(brainwt, relative_brain)

# what is the mean brainwt?
 
 
 
 # Thursday 10/21/21 --------------------
 
 # summarize() -------------------
 #get_help("mean") will show you several summary statistics


#mean(msleep$brainwt, na.rm = TRUE)

msleep %>%
  drop_na(brainwt) %>%
  summarize(mean_brainwt = mean(brainwt))


msleep %>%
  summarize(mean_awake = mean(awake))

msleep %>%
  mutate(mean_awake = mean(awake))

# How many hours on average does each VORE spend awake?
 
msleep %>%
  drop_na(vore, conservation) %>%
  group_by(vore, conservation) %>%
  summarize(sd_awake = sd(awake))

# can i count the number of combos?
msleep %>%
  drop_na(vore, conservation) %>%
  count(vore, conservation) 
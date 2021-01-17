## Notes Thursday 10/29/20
library(tidyverse)


## Part 1: tidyr functions unite() and separate() -----------------------

# unite(new_column_name, SINGLE ARGUMENT of columns to unite, sep = "separate by")
### note behavior of remove and na.rm

# separate(column_to_be_separated, into = c("columns", "to", "create"), sep = "separate them by")


# Use `tidyr::table5` to practice unite()
table5 %>%
  unite(full_year, century:year, sep="", remove = FALSE)

table5 %>%
  unite(full_year, century:year, sep="!!!!!!")


table5 %>%
  unite(full_year, century:year)


# Use `tidyr::table5` to practice separate(), and then unite()!

table5 %>%
  separate(rate, into = c("cases", "population"), sep = "/") %>% 
  unite(full_year, century:year, sep="") -> new_table1



## Part 2: working with TWO tables in dplyr --------------------------------

# bind_rows(df1, df2): "more of the same data"
# df1 %>% bind_rows(df2)
damsel_bind1 <- read_csv("damselfly_bind1.csv")
damsel_bind2 <- read_csv("damselfly_bind2.csv")

# SAME VARIABLES/COLUMNS
# DIFFERENT ROWS AKA OBSERVATIONS

# all have the equivalent result
bind_rows(damsel_bind1, damsel_bind2) # put 1 on top, then 2
bind_rows(damsel_bind2, damsel_bind1) # put 2 on top, then 1

bind_rows(damsel_bind1) %>%
  bind_rows(damsel_bind2)

# what if i had a third?
damsel_bind3 <- damsel_bind2

# YES!!!!!!!!!!!!!!!!!!!!!
bind_rows(damsel_bind1, damsel_bind2, damsel_bind3)

# FYI there is a bind_cols() as well, but we won't use it in this class, unless you personally want to use it!








# RELATIONAL DATA: At least one column in common. 
damsel_join1 <- read_csv("damselfly_join1.csv")
damsel_join2 <- read_csv("damselfly_join2.csv")




# both have id and are ABOUT DAMSELFLIES
# FOUR of the damselfies are represented in both datasets: 1, 2, 3, 6
# THREE are not: 4,5 only in join1. 7 only in join2
# SEVEN TOTAL DAMSELFLIES!




# ARGUMENTS IN THE SAME ORDER !!!

left_join(damsel_join1, damsel_join2)

# equivalent to above:
# damsel_join1 %>%
#  left_join(damsel_join2)
  
right_join(damsel_join1, damsel_join2)
full_join(damsel_join1, damsel_join2)
inner_join(damsel_join1, damsel_join2)
anti_join(damsel_join1, damsel_join2)


# left_join(df1, df2)
# https://github.com/corydupai/OCH_codealong/blob/master/animated-left-join.gif


# right_join(df1, df2)
# https://github.com/corydupai/OCH_codealong/blob/master/animated-right-join.gif

# full_join(df1, df2)
# https://github.com/corydupai/OCH_codealong/blob/master/animated-full-join.gif

# inner_join(df1, df2)
# https://github.com/corydupai/OCH_codealong/blob/master/animated-inner-join.gif

# anti_join(df1, df2)
# https://github.com/corydupai/OCH_codealong/blob/master/animated-anti-join.gif

# there are more joins!!! but that's enough...
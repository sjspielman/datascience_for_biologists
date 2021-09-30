library(tidyverse) # load tidyverse to have access to ggplot2 and forcats functions
library(ds4b.materials) # load class library to have access to sparrows dataset

ggplot(sparrows) + 
  aes(x = Wingspread, y = Femur_Length) + 
  geom_point(shape = 5, color = "blue")

ggplot(sparrows) + 
  aes(x = Wingspread, 
      y = Femur_Length) + 
  geom_point(fill = "firebrick1")

ggplot(sparrows) + 
  aes(x = Wingspread, 
      y = Femur_Length) + 
  geom_point() +
  geom_smooth(method = "lm")


ggplot(sparrows) + 
  aes(x = Wingspread, 
      y = Femur_Length, 
      color = Survival) + 
  geom_point() +
  geom_smooth(method = "lm")



ggplot(sparrows) + 
  aes(x = Wingspread, 
      y = Femur_Length) + 
  geom_point(aes(color = Survival)) +
  geom_smooth(method = "lm")


ggplot(sparrows) + 
  aes(x = Wingspread, 
      y = Femur_Length) + 
  geom_point() +
  geom_smooth(aes(color = Survival), 
              method = "lm")


ggplot(sparrows) + 
  aes(x = Age, y = Wingspread) + 
  geom_boxplot() + 
  geom_jitter()


# fct_relevel(sparrows$Age, "Juvenile", "Young", "Adult")
ggplot(sparrows) + 
  aes(x = Age, 
      y = Wingspread, 
      color = Survival) + 
  geom_jitter(width = 0.15) +
  labs(x = "new xaxis label", color = "NEW!!!")



ggplot(sparrows) + 
  aes(x = fct_relevel(Age, "Juvenile", "Young", "Adult"), 
      y = Wingspread) + 
  geom_jitter(width = 0.15) +
  labs(x = "Age")

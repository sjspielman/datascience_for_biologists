# Class demonstration on Wednesday 9/29/21 by Spielman

library(tidyverse) # load tidyverse to have access to ggplot2 and forcats functions
library(ds4b.materials) # load class library to have access to sparrows dataset

# Using shape type 5 and color blue to style all points in scatterplot
ggplot(sparrows) + 
  aes(x = Wingspread, y = Femur_Length) + 
  geom_point(shape = 5, color = "blue")

# Fill doesn't work on regular points! They'll stay default black since they can't be filled
ggplot(sparrows) + 
  aes(x = Wingspread, 
      y = Femur_Length) + 
  geom_point(fill = "firebrick1")

# Include a linear trendline with the scatterplot.
# geom_smooth() adds trendlines of many types, and the argument `method = "lm"` ensures it's a LINEAR one.
ggplot(sparrows) + 
  aes(x = Wingspread, 
      y = Femur_Length) + 
  geom_point() +
  geom_smooth(method = "lm")


# Include a color mapping, which is INHERITED by both geom_point and geom_smooth. Points are colored by Survival, and there are two separate trendlines for each Survival category (level)
ggplot(sparrows) + 
  aes(x = Wingspread, 
      y = Femur_Length, 
      color = Survival) + 
  geom_point() +
  geom_smooth(method = "lm")


# Include a color mapping but ONLY TELL geom_point() about it! This means points will have mapped colors, but geom_smooth will not - only ONE TRENDLINE for all points comes out
ggplot(sparrows) + 
  aes(x = Wingspread, 
      y = Femur_Length) + 
  geom_point(aes(color = Survival)) +
  geom_smooth(method = "lm")


# Include a color mapping but ONLY TELL geom_smooth() about it! This means trendlines will have mapped colors, but geom_point will not - two trendlines but all points are black
ggplot(sparrows) + 
  aes(x = Wingspread, 
      y = Femur_Length) + 
  geom_point() +
  geom_smooth(aes(color = Survival), 
              method = "lm")

# It's possible to overlap geoms: here we have a jitter on top of a boxplot
ggplot(sparrows) + 
  aes(x = Age, y = Wingspread) + 
  geom_boxplot() + 
  geom_jitter()


# Example of using labs() to change the x-axis label and the color legend title
ggplot(sparrows) + 
  aes(x = Age, 
      y = Wingspread, 
      color = Survival) + 
  geom_jitter(width = 0.15) +
  labs(x = "new xaxis label", color = "NEW!!!")


# Change the order of Age on the x-axis using fct_relevel()
ggplot(sparrows) + 
  aes(x = fct_relevel(Age, "Juvenile", "Young", "Adult"), 
      y = Wingspread) + 
  geom_jitter(width = 0.15) +
  labs(x = "Age")

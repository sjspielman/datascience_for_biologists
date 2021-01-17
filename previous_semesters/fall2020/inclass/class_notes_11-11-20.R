## Linear modeling notes, 
library(tidyverse)
library(palmerpenguins)
library(broom) #tidyverse, but not "core" tidyverse so load separately


# Can we explain variation in penguin bill length?
## In other words --> if we know something about <other variables>, do we know something about bill length?
## NOT SAYING: do these other variables CAUSE bill length values?

# Can we explain variation in bill length with bill depth?
# predictor: bill_depth_mm      independent variables, explanatory variables
# response: bill_length_mm       dependent variable


## Assumptions of linear models:
# 1. numeric predictors are LINEARLY RELATED to the response
# 2. categorical predictors have EQUAL VARIANCE among groups
# 3. model RESIDUALS are normally distributed
# COMMON MISCONCEPTION: variables themselves must be normally distributed. THIS IS NOT TRUE.

# Y = mX + b

# REGRESSION : fit the model to the data
# RESPONSES ARE NUMBERS

# THING 1: PLOT THE DATA
ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm)) + 
  geom_point()
## Is this linear? YES

# THING 2: MODEL
#lm(y ~ x, data = dataframe_name)
fit <- lm(bill_length_mm ~ bill_depth_mm, data = penguins)

# THING 3: check the residuals
#fit$residuals
# qq plot is a common thing that shows you VISUALLY: does my data look like a distribution

qqnorm(fit$residuals)
qqline(fit$residuals, col = "red")
# IF POINTS ARE ON LINE, YES NORMAL!!!


# FINALLY, LOOK AT THE MODEL!!!
summary(fit)

broom::tidy(fit) # clean view of intercept, slope
broom::glance(fit) # clean view of adj.r.squared and its pvalue

# Y = -0.6498X + 55.0674
# statistically confident that these numbers are NOT 0
# when bill depth is 0, the bill length will be 55. This significant with P<2e-16, but it is not realistic.
# when bill depth increases by 1, we expect bill length length to decrease by 0.649 (slope = rise/run = y/x = -0.649/1 = length decreases 0.649 when depth increases by 1)



# r^2 =  0.05247 highly significant at P=1.12e-05
# 5% of bill length variation is explained by depth
# statistical significant vs effect size/ biological signif.
# not a powerful predictor. significant, but not necessarily USEFUL OR HELPFUL

# Visualize our results!
# does depth predict length?
ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm)) + 
  geom_point() + 
  geom_smooth(method = "lm") + 
  labs(subtitle = "Y = -0.6498X + 55.0674") + 
  annotate("text", 
           x= 14, y = 57, col = "purple", 
           label = "R^2 == 0.05", parse=TRUE)




# numeric response, ALL OF THEM!
# CATEGORICAL PREDICTOR: species.
# to what extent does species explain variation in bill length?
# ANOVA: is at least one of the means different?

# assumption: categories have EQUAL VARIANCE
ggplot(penguins, aes(x = species, y = bill_length_mm)) + geom_point()

# build our model:
fit <- lm(bill_length_mm ~ species, data = penguins)

# check residuals are normal????
qqnorm(fit$residuals)
qqline(fit$residuals, col = "red")

broom::tidy(fit)

# adelie have mean length of 38.8. definitely not 0 since p=2.50e-322
# Chinstrap mean is on average 10 more than adelie. significant!
# Gentoo mean is on average 8.7 more than adelie. significant!

broom::glance(fit)

# R^2 = 0.706. P=2.69e-91
# moderate-to-strong. pretty good predictor of bill length!!

ggplot(penguins, aes(x = species, y = bill_length_mm, fill = species)) + 
  geom_violin() + 
  stat_summary() + 
  annotate("text", x = 1.5, y = 55, label = "R^2 == 0.706", parse=T)



# MULTIPLE PREDICTORS!!!!
# Can species AND bill depth predict bill length???

fit <- lm(bill_length_mm ~ species + bill_depth_mm, data=penguins)

qqnorm(fit$residuals)
qqline(fit$residuals, col = "red")

summary(fit)

#y = x1*9.9 + x2*13.4 + x3*1.39 + 13

# r^2 = 0.7874 
# this model is the BEST so far

ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm, color = species)) + 
  geom_point() + 
  geom_smooth(method = "lm")

# 0.7995 

# INTERACTION
fit <- lm(bill_length_mm ~ species * bill_depth_mm, data=penguins)
summary(fit)




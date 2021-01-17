## Notes for logistic regression


## Load libraries and data -------------------
library(tidyverse)
library(broom)

biopsy <- read_csv("biopsy.csv")

## Build the model:
# glm(response ~ predictors, data = dataframe, family = "binomial")
# glm expects the response to be a factor, or(!!!!) have values 0=failure and 1=success
# malignant --> 1, benign --> 0

biopsy %>%
  mutate(outcome_01 = if_else(outcome == "malignant", 1, 0)) %>%
  # i did this line to make sure outcome_01 worked like i wanted!
  #select(outcome_01, outcome, everything()) %>%
  select(-outcome) -> biopsy_outcome01

full_model <- glm(outcome_01 ~ ., data = biopsy_outcome01, family = "binomial")
final_model <- step(full_model) # chooses which predictors to KEEP using "smart things we don't have time to talk about"

# now we can look at the model saved in: final_model
broom::tidy(final_model) # and then remind ourselves: hey, don't look at that

# FYI: slide 12-13, prove that.....
## Y = X was linear regression
## p = t is logistic regression, where t = Y
## in logistic, p goes on Yaxis and t goes on Xaxis

## our t values (aka X axis)
final_model$linear.predictors

## our p values (aka Y axis)
final_model$fitted.values

tibble(x = final_model$linear.predictors, 
       y = final_model$fitted.values, # prob of success where malignant = success
       truth = biopsy$outcome) %>%
  ggplot(aes(x=x, y=y)) +
  geom_line() + # NOT COLORING THIS!! STAYS BLACK!!
  geom_point(aes(color = truth), alpha = 0.5) + 
  labs(x = "Linear predictors", 
       y = "Probability of malignancy, according to model") +
  scale_color_brewer(palette = "Set1")








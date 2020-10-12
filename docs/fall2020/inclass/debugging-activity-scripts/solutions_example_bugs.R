library(tidyverse)
iris_copy <- iris 


## bug 1 --------------------------------------

#iris_copy$Species <- factor(iris_copy$Species, levels = ("versicolor", "setosa", "virginica"))

# Missing the c() when specifying the array of new levels
iris_copy$Species <- factor(iris_copy$Species, levels = c("versicolor", "setosa", "virginica"))


## bug 2 --------------------------------------
#iris_copy$Species <- factor(iris_copy$Species, levels = c("versicolor,setosa,virginica"))

# This code has "versicolor,setosa,virginica" as ONE string. We need more quotes:
iris_copy$Species <- factor(iris_copy$Species, levels = c("versicolor","setosa","virginica"))

## bug 3 -----------------------------------------
#iris_copy$Species <- factor(iris_copy$Species, levels = c("verscolor", "setosa", "virginica"))

# verscolor should be versicolor
iris_copy$Species <- factor(iris_copy$Species, levels = c("verscolor", "setosa", "virginica"))


## bug 4 ---------------------------------------
#iris_copy$Species <- factor(iris_copy$Sepal.Length, levels = c("versicolor","setosa","virginica"))

# The wrong column was used in factor() - should be Species not Sepal.Length!
iris_copy$Species <- factor(iris_copy$Species, levels = c("versicolor","setosa","virginica"))



## bug 5 --------------------------------------
#ggplot(irs, aes(x = Sepal.Length)) + 
#  geom_histogram()

# iris was spelled incorrectly as irs, and we need to load the ggplot library
ggplot(iris, aes(x = Sepal.Length)) + 
  geom_histogram()


## bug 6 --------------------------------------
#ggplot(aes(x = Sepal.Length)) + 
#  geom_histogram()

# iris wasn't given to ggplot
ggplot(iris, aes(x = Sepal.Length)) + 
  geom_histogram()




## bug 7 --------------------------------------
#ggplot(iris, aes(x = Sepal.Length)) + 
#  geom_point()

# you need to specify X and Y axes to make a scatterplot with geom_point
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point()


## bug 8 --------------------------------------
#ggplot(iris, aes(x = Sepal.Length)) +
#  geom_histogram()
#  xlab("Sepal Lengths")

# missing a plus sign after histogram and before xlab
ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram() +
  xlab("Sepal Lengths")


## bug 9 --------------------------------------
#ggplot(iris, aes(x = Sepal.Length)) +
#  + geom_histogram()

# there was an extra plus sign
ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram()

## bug 10 --------------------------------------
#iris %>%
#  filter(species == "setosa")

# species should be Species, and you need to load the dplyr library
iris %>%
  filter(Species == "setosa")

## bug 11 --------------------------------------
#iris %>%
#  filter(Species == "setosa") %>%
  

# extra pipe symbol so R is still waiting!
iris %>%
  filter(Species == "setosa")

## bug 12 -------------------------------
#iris %>%
#  filter(Species = "setosa")

# need a DOUBLE equals
iris %>%
  filter(Species == "setosa")


## bug 9 --------------------------------------
#Iris %>%
#  filter(Species == "setosa")

# should be iris not Iris
iris %>%
  filter(Species == "setosa")


## bug 13 ----------------------------------
#iris + 
#  filter(Species == "setosa")

# uses the wrong symbol. needs a %>% not a +
iris %>%
  filter(Species == "setosa")


## bug 14 --------------------------------------
#ggplot(iris, aes(x = Sepal.Length)) %>%
#  geom_histogram()

# a pipe was used instead of a plus sign
ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram()


## bug 15 --------------------------------------
#iris %>%
#  filter(Species == "setosa") %>%
#  ggplot(aes(x = Sepal.Length)) %>%
#  geom_histogram()

# a pipe was used in the ggplot section of the code instead of a plus sign
iris %>%
  filter(Species == "setosa") %>%
  ggplot(aes(x = Sepal.Length)) +
  geom_histogram()

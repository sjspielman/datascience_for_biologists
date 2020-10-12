#library(ggplot2)
#library(dplyr)
library(tidyverse)


## bug 1 --------------------------------------
iris_copy <- iris # run this first to set up the bug for fixing. This is NOT the bug. RE-RUN this line of code if you need to "restore" iris_copy

iris_copy$Species <- factor(iris_copy$Species, levels = c("versicolor", "setosa", "virginica"))

# unexpected comma, forgot to use c() when defining an array

# CHECK IT: levels(iris_copy$Species)

## bug 2 --------------------------------------
iris_copy <- iris # run this first to set up the bug for fixing

iris_copy$Species <- factor(iris_copy$Species, levels = c("versicolor","setosa","virginica"))
levels(iris_copy$Species)


## bug 3 -----------------------------------------
iris_copy <- iris # run this first to set up the bug for fixing

iris_copy$Species <- factor(iris_copy$Species, levels = c("versicolor", "setosa", "virginica"))
levels(iris_copy$Species)


## bug 4 ---------------------------------------
iris_copy <- iris # run this first to set up the bug for fixing

iris_copy$Species <- factor(iris_copy$Sepal.Length, levels = c("versicolor","setosa","virginica"))

iris_copy$Species <- factor(iris_copy$Species, levels = c("versicolor","setosa","virginica"))


## bug 5 --------------------------------------
ggplot(iris, aes(x = Sepal.Length)) + 
  geom_histogram()










## bug 6 --------------------------------------
ggplot(iris, aes(x = Sepal.Length)) + 
  geom_histogram()





## bug 7 --------------------------------------
# note: the goal for this plot is a scatterplot of sepal width (y) against sepal length (x)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point()



## bug 8 --------------------------------------
ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram() +
  xlab("Sepal Lengths")


## bug 9 --------------------------------------
ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram()


  
  

## bug 10 --------------------------------------
iris %>%
  filter(Species == "setosa")

  
  
  

## bug 11 --------------------------------------
#iris %>%
#  filter(Species == "setosa") %>%
# couldnt find the bug up there

iris %>%
  filter(Species == "setosa")


## bug 12 -------------------------------
iris %>%
  filter(Species == "setosa") # needs another equals!



## bug ?!@?#R! --------------------------------------
iris %>%
  filter(Species == "setosa")


## bug 13 ----------------------------------
iris %>%   #+ 
  filter(Species == "setosa")



## bug 14 --------------------------------------
ggplot(iris, aes(x = Sepal.Length)) +   #%>%
  geom_histogram()




## bug 15 --------------------------------------
iris %>%
  filter(Species == "setosa") %>%
  ggplot(aes(x = Sepal.Length)) +
  geom_histogram()


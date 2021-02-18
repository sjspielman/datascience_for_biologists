library(tidyverse)

# Part 1: fct_relevel() --------------------------------

# Example: barplot of how many of each Species
# The Species names are on the X-axis in the same order that comes from: `levels(iris$Species)`
ggplot(iris) + 
  aes(x = Species) + 
  geom_bar() 

# What if we wanted to CHANGE THE APPEARANCE ORDER? We need to "relevel" this variable.
# We can do this "on the fly" in the plotting code with fct_relevel()
# Instead of saying x = Species, say: x = fct_relevel(STUFF), aka x = the reordered Species
ggplot(iris) + 
  aes(x = fct_relevel(Species, "virginica","setosa", "versicolor")) + 
  geom_bar() 

# What if we also want a reordered fill to match?
# This is how we'd fill by Species in the default order:
ggplot(iris) + 
  aes(x = Species, fill = Species) + 
  geom_bar() 

# We can just specify the ****fct_relevel() version of Species**** whereever we want the new order!
ggplot(iris) + 
  aes(x = fct_relevel(Species, c("setosa", "virginica", "versicolor")),
      fill = fct_relevel(Species, c("setosa", "virginica", "versicolor"))) + 
  geom_bar()


# Part 2: aes() placement --------------------------------

ggplot(iris) + 
  # on its own line - applies to EVERYTHING
  aes(x = Sepal.Length, y = Sepal.Width) + 
  geom_point() + 
  geom_text(label = "HELLO")

# within ggplot() - applies to EVERYTHING
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point() + 
  geom_text(label = "HELLO")

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  # ONLY point knows about the color mapping
  geom_point(aes(color = Species)) + 
  geom_text(label = "HELLO")


ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point() + 
  # ONLY text knows about the color mapping now 
  geom_text(label = "HELLO", aes(color = Species))

# Note that the order of arguments to the geom doesn't matter. Below the same as the code above:
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point() + 
  # argument order doesn't matter
  geom_text(aes(color = Species), label = "HELLO")


# What about this version? ggplot ADDS plot bits ON TOP of each other
# So here, points will be ON TOP OF text! Previously writing geom_text second, the points were underneath text, since text got added (literally with +) after
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_text(aes(color = Species), label = "HELLO") +
  geom_point()  


# Finally, this version? applies x/y to everything, and we applied color to both text and point, so this is the same as putting color in the first ggplot(aes())
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_text(aes(color = Species), label = "HELLO") +
  geom_point(aes(color = Species))  

# you can have as many aes() as you want! your code style, your choice
ggplot(iris) + 
  aes(x = Sepal.Length) + 
  aes(y = Sepal.Width) + 
  aes(color = Species)
  geom_text(label = "HELLO") +
  geom_point()  
# Class demonstration script on Monday 9/27/21, Dr. Spielman

# Load the tidyverse suite of libraries, including ggplot2.
library(tidyverse)


# Spielman provided this code to create the `msleep_smol` dataset we used for plotting.
# You might catch that this code uses the **forward assignment operator**, ->, to create the variable name `mslee_smol`. You can learn more in the introverse: get_help("assignment")
# You might also see familiar things like...
### The %in% operator!
### Asking if something is  <= 7
### The function as.factor() to convert something to a factor!
ggplot2::msleep %>%
  dplyr::filter(vore %in% c("carni", "herbi", "omni")) %>%
  dplyr::select(-genus, -sleep_cycle, -sleep_rem, -sleep_total) %>%
  dplyr::filter(bodywt <= 7) %>%
  dplyr::mutate(vore = as.factor(vore),
                order = as.factor(order),
                conservation = as.factor(conservation)) %>%
  tidyr::drop_na() -> msleep_smol


# Create a histogram of the msleep_smol column 
# This histogram is saved to a variable called `hist1`
hist1 <- ggplot(msleep_smol) + # set up plot
  aes(x = awake) +    # map awake to the x axis
  # make a histogram
  geom_histogram(bins = 6, 
                 color = "blue", 
                 fill = "hotpink") 

# The same code as above to make the histogram, but this demonstrates how to use the FORWARD ASSIGNMENT operator to save to variable called `hist1`
ggplot(msleep_smol) + # set up plot
  aes(x = awake) +    # map awake to the x axis
  # make a histogram
  geom_histogram(bins = 6, 
                 color = "blue", 
                 fill = "hotpink")  -> hist1

# Scatterplot of brainwt across bodywt, where points have "just a color" of forestgreen
ggplot(msleep_smol) +
  aes(x = bodywt, y = brainwt) + 
  geom_point(color = "forestgreen")

# Scatterplot of brainwt across bodywt, where points are colored by vore, aka color is mapped to the vore column
ggplot(msleep_smol) +
  aes(x = bodywt, 
      y = brainwt, 
      color = vore) + 
  geom_point()

# This code shows an alternative way to make the same plot. You can use aes() either on its own, as an argument to an geom, or also(!) as an argument to ggplot(). 
ggplot(msleep_smol) +
  aes(x = bodywt, 
      y = brainwt) + 
  geom_point(aes(color = vore))


# Density plot of the awake column with "just a fill" and "just a color"
ggplot(msleep_smol) +
  aes(x = awake) +
  geom_density(color = "deepskyblue4", 
               fill = "goldenrod1",
               size = 1) # changes the outline size

# Density plot of the awake column, filled according to vore (fill mapped to vore!), and transparency added to make sure we can see all of them. This is saved to a variable.
ggplot(msleep_smol) +
  aes(x = awake, 
      fill = vore) +
  # the alpha adds transparency
  geom_density(alpha = 0.7) -> awake_density

# Showing how you can ADD MORE! things to existing plots saved to variables, for example modofying the theme! You can always change the theme as part of the code as well - you don't have to add on themes separately, this was just for example.
awake_density + theme_classic() -> awake_density_classic
awake_density + theme_bw()
awake_density + theme_dark()

# Boxplot of the awake column, across vore, where there is "just a color" and "just a fill", and the classic theme is used.
ggplot(msleep_smol) +
  aes(x = vore, 
      y = awake)+
  geom_boxplot(fill = "yellow", color = "red") +
  theme_classic()

# Violin of the awake column, across vore, where there is "just a color" and "just a fill", and the classic theme is used.
ggplot(msleep_smol) +
  aes(x = vore, 
      y = awake)+
  geom_violin(fill = "yellow", color = "red")

# Jitter/strip plot of the awake column, across vore, where color is mapped to vore.
ggplot(msleep_smol) +
  aes(x = vore, 
      y = awake, 
      color = vore) +
  # The width = 0.2 argument is helpful to make sure the separate jitters are clearly separate on the x-axis. There is nothing magic about the 0.2 value, just that Spielman likes it from trial and error.
  geom_jitter(width = 0.2)


### Continued on Wednesday 9/29/21

# Making barplots, specifically barplots that show COUNTS OF A CATEGORICAL VARIABLE!
## Spielman demo from Wednesday 10/6/21

# Load libraries at the TOP OF YOUR FILES, even if you only "realize" you need them later
library(tidyverse)  # ggplot2 and more!
library(ds4b.materials) # access the sparrows dataset
library(colorblindr) # allows you to check if colorblindr friendly

## Faceting -------------------------------------------------

# Histogram of the `Weight` variable
ggplot(sparrows) + 
  aes(x = Weight) + 
  geom_histogram(fill = "forestgreen", 
                 color = "black")

# Still a histogram of the `Weight` variable, but split into three panels (facets) based on Age (three categories, three panels!). Uses `facet_wrap()` to facet across ONE variable
ggplot(sparrows) + 
  aes(x = Weight) + 
  geom_histogram(fill = "forestgreen", 
                 color = "black") +
  facet_wrap(vars(Age)) # vars() is used for faceting ONLY!!!


# The argument `scales = "free"` will make the axis scales in each panel (facet) have a different range based on values in each facet.
# `scales = "free_x` will allow JUST x-axis to vary.
# `scales = "free_y` will allow JUST y-axis to vary.
#` scales = "free` will allow BOTH AXES to vary.
ggplot(sparrows) + 
  aes(x = Weight) + 
  geom_histogram(fill = "forestgreen", 
                 color = "black", bins = 7) +
  facet_wrap(vars(Age), scales ="free") 



# `facet_grid()` is another way to facet that allows to you make a GRID to facet across two variables (here, Sex and Age)
ggplot(sparrows) + 
  aes(x = Weight) + 
  geom_histogram(fill = "thistle", 
                 color = "black", bins = 7) +
  facet_grid(rows = vars(Sex), 
             cols = vars(Age))


# See use of `scales = "free"` here - this is as flexible as `facet_grid()` can get with individual panel axes. 
ggplot(sparrows) + 
  aes(x = Weight) + 
  geom_histogram(fill = "thistle", 
                 color = "black", bins = 7) +
  facet_grid(rows = vars(Sex), 
             cols = vars(Age), scales = "free")


## Customing color and fill SCALES - aka, customize palettes that appear when you MAP COLOR AND FILL -----------------

# Your best friend: https://spielmanlab.github.io/introverse/articles/color_fill_scales.html

# Get some practice with this in the Set 6 ggplot2 exercises: https://sjspielman.github.io/datascience_for_biologists/exercises/ggplot2.html#Set_6:_Customizing_mapped_color_and_fill_palettes

# The function scale_fill_manual() can be used to choose your own colors
ggplot(sparrows) + 
  aes(x = Weight, 
      fill =  Age) + 
  geom_density(color = "black", alpha = 0.6) +
  scale_fill_manual(values = c("darkorange2",
                               "firebrick", 
                               "darkslategray4")) ->myplot

# Above we saved the plot to a variable to be able to check if colorblind friendly with the colorblindr function `cvd_grid()`
cvd_grid(myplot)


# The function `scale_color_distiller()` can be used to apply a colorbrewer palette to a CONTINUOUS (Tarsus_Length!) color mapping
ggplot(sparrows) + 
  aes(x = Weight, 
      y = Wingspread, 
      color = Tarsus_Length) + 
  geom_point() + 
  scale_color_distiller(palette = "BuPu")


# The function `scale_color_viridis_d()` can be used to apply a viridis palette to a DISCRETE/CATEGORICAL (Age!) color mapping
ggplot(sparrows) + 
  aes(x = Weight, 
      y = Wingspread, 
      color = Age) + 
  geom_point() + 
  scale_color_viridis_d(option = "plasma")
  
# The function `scale_color_viridis_c()` can be used to apply a viridis palette to a CONTINUOUS (Tarsus_Length!) color mapping
ggplot(sparrows) + 
  aes(x = Weight, 
      y = Wingspread, 
      color = Tarsus_Length) + 
  geom_point() + 
  scale_color_viridis_c(option = "plasma")
  
# Jitter plot of  Wingspread across Age where points are colored by Age using a brewer palette called  "Pastel2".
# scale_color_brewer() can be used to apply a colorbrewer palette to a DISCRETE/CATEGORICAL (Age!) color mapping
ggplot(sparrows) + 
  aes(x = Age, 
      y = Wingspread, 
      color = Age) +
  geom_jitter(width = 0.2) +
  scale_color_brewer(palette = "Dark2")



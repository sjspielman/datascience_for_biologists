library(tidyverse)


# Example: defining paths to directories ------------------------------------------------------
# Defines the relative path to the `koala/` directory 
path_to_koala_directory <- file.path("mammals", "marsupials", "koala")
path_to_koala_directory # look at the variable, see how it's nicely formatted!

# Check if the variable was defined correctly with dir.exists()
dir.exists(path_to_koala_directory)


# Example: Defining paths to files ----------------------------------------------------------
# Defines the relative path to the FILE `run_koala_code.R`.
path_to_koala_code <- file.path("mammals", "marsupials", "koala", "run_koala_code.R")
path_to_koala_code

# Check if the variable was defined correctly with file.exists()
file.exists(path_to_koala_code)

# Or, you can use the `path_to_koala_directory` variable!! Yay variables!! SERIOUSLY, YAY VARIABLES!!
path_to_koala_code2 <- file.path(path_to_koala_directory, "run_koala_code.R")
path_to_koala_code2
file.exists(path_to_koala_code2)


# Task: Define the relative path to the DIRECTORY `tasmanian_devils/` and check that it's correct. -------------------



# Task: Define the relative path to the FILE `little_nuggets.R/` directory and check that it's correct. ---------------------
### Do this using the variable you made for the `tasmanian_devils/` path!


# Task: Keep going! Make a variable for each of these DIRECTORIES: `kangaroo/`, `monotremes/`, and `datasets/`. -------------
### Check them all for accuracy, and use meaningful variable names.


# Task: Keep going more!! Make a variable for each of these FILES: `we_are_not_wallabies.R`, `little_nuggets.R`, and `who_is_not_extinct.R/`.
### Check them all for accuracy, and use meaningful variable names, and again, do this using the variables you made for the directories!


##################################################################################
##################################################################################

# Create a variable that contains the path to the FILE `mole.csv`, and check it with `file.exists()`----
## This should use a variable you defined above! Hint!!

# Use `read_csv()` to read in the mole.csv file and save to a variable, `mole_data` ----------------



# Make a boxplot of `lnmass` across `worker`, and save the plot to a variable `mole_plot` ----------



# Save this boxplot to a file called `figures/mole_plot.png` --------------
# To accomplish this.....
### You first need to create the directory `figures/`!!! Do this with the `New Folder` button in the Files Pane directly with "point-and-click".
### Create a variable called `mole_plot_file` that contains the path to the file you'll be saving it to
### Save with `ggsave`! You will to fiddle with `width` and `height` arguments!! Hurray trial and error!!

## Instructions for in-class activity on 2/24/21
#### Data Science for Biologists, Spring 2021

> This activity uses the RStudio Cloud Project "Paths and file input-output". Click the "Start" button you see with this Project to get a copy of this project!

In the virtual cloud computer you are using on the RStudio Cloud website, by default, your *working directory* (aka, folder where you are working in R from) is `/cloud/project/`. There are several files and directories you see inside this directory, which have this _directory structure_:

```
/cloud/project/
────────────────────────────────────────────────
├── .Rhistory
├── mammals/
│   ├── marsupials/
│   │   ├── kangaroo/
│   │   │  └── we_are_not_wallabies.R
│   │   ├── koala/
│   │   │  └── run_koala_code.R
│   │   ├── tasmanian_devil/
│   │   │  └── little_nuggets.R
│   ├── monotremes/
│   │   └── who_is_not_extinct.R
│   ├── placentals/
│   │   ├── mole_experiment_data/
│   │   │  └── moles.csv
│   │   ├── seal_experiment_data/
│   │   │  └── seals.csv
├── project.Rproj
```

For these "exercises," you will practice writing the *relative paths* to different files and directories. **The relative path means: What is the path to the file/directory *FROM* (relative to) the directory where I am working, aka the "working directory"?** It is in contrast to the "absolute path," also known as the "full path," which refers to the fully defined path that can be reached anywhere from the computer. 

##### _An analogy: What is the path to Walgreens?_

1. **Relative path version**: From my house, make a right and then a left. Walgreens will be on the left. 
    + The relative path depends on where you are starting from. In this example, "my house" is analogous to the working directory.
    + There is no "single" relative path to any file or directory, since it depends on the starting location.
    + The relative path from standing outside of Walgreens to Walgreens is simply "go inside Walgreens."
2. **Absolute path version**: 2345 Main Street, Mystery Town, NJ, USA
    + The absolute path does NOT depend on where you are starting from. You can reach the address from any starting location.


## Exercises

### Part 1

1. First, using "regular point and click" in the Files Pane, explore the contents of the `mammals` folder to make sure you understand the file structure diagram. Spend 2-4 minutes on this!!

2. Open the templated script `practice_paths.R` in the RStudio Cloud project, which contains a variable `path_to_koala_directory` and is defined as the *relative path* from this script's directory (`/cloud/project/`) to the `koala/` directory. Then, the function `dir.exists()` is used to confirm the directory exists (aka was correctly written!!). See how this function prints `TRUE`!

3. The script also contains a pre-defined variable that defines the path to the script `run_koala_code.R` The function `file.exists()` is then used to confirm the file exists, and it does - output is `TRUE`!

4. **Task:** 


  + `path_to_devils_directory`, which should contain the relative path to the directory `tasmanian_devils/`.
  + `path_to_not_wallabies` which shoud contain the relative path to the `file` we_are_not_wallabies
  + `path_to_datasets`, which should contain the relative path to the directory `datasets/`.
  + `path_to_alive_code`, which should contain the r

5. Determine the relative path from the working directory to the directory `tasmanian_devil/`. Save this string as `path_to_devils_directory`. Use `dir.exists()` to check your work.

6. Determine the relative path from the working directory to the directory `seal_experiment_data/`. Save this string as `path_to_seals_directory`. Use `dir.exists()` to check your work.

7. Determine the relative path from the working directory to the file `who_is_not_extinct.R`. Save this string as `path_to_alive_code`. Use `file.exists()` to check your work.

8. Determine the relative path from the working directory to the file `little_nuggets.R`. Save this string as `path_to_nugget_code`. Use `file.exists()` to check your work.


### Part 2

<br><br>
1. Use the `read_csv()` function to read the file `moles.csv`, and save the data frame output to `moles_data`. [Recall](https://sjspielman.github.io/datascience_for_biologists/tutorials/readr_ggsave.html#Reading_and_writing_data_files) that `read_csv()` takes ONE argument: the path to the file you want to read in.

  + Make sure the `moles_data` variable was correctly made by trying to explore its contents, e.g. with `head()`, `summary()`, `names()`, etc. 

<br><br>
2. Perform the same task slightly differently.... 

  + Define two variables first: 1) a string variable containing _the path to the directory where `moles.csv` lives_, and 2) a string variable containing the name of the file only (i.e., `"moles.csv"`).
  + _Combine them_ using the function `file.path()`. This function is like a special kind of `paste()` specifically for path information. Simply give your two variables (in the right order - trial and error time!, as arguments to `file.path()`, and the output should give the whole relative path to `"moles.csv"`
  + Save the output from `file.path()` as a variable `path_to_moles`
  + Provide the variable `path_to_moles` to the `read_csv()` function to again read in the dataset, and make sure it worked!
  

<br><br>
3. Repeat the previous task, except this time read in the file `"seals.csv"` instead. This question will force you to practice, using `file.path()` to create...file paths!... and then read the data in with `read_csv()`.
 
  
<br><br>
4. Let's practice saving data with `write_csv()`, which takes two arguments: 1) the data frame to export, and 2) the file name (including path! everything's a path!) you want to export it to. Export the `msleep` dataframe to a file `"msleep.csv"` using `write_csv()`. This will save the file to the _working directory_. Run the code and make sure the file appears in the Files Pane.

  + Remember `msleep`? It actually comes with `ggplot2`, so the dataset was loaded when we ran `library(tidyverse)`!
  
  
<br><br>
5. Now, let's save the dataset again, but this time save it _inside the directory `mammals`_. First, determine what the path to a file `msleep.csv` inside the `mammals/` directory would be as a string, and then provide that string as the second argument to `write_csv()`. Again, check in the Files Pane that it worked.


<br><br>
6. Let's practice actually using the `source()` function. We use this function all the time, to run entire scripts. You may have noticed that some code gets written in Console when you click the Source button - let's see it in action! Copy/paste this code into Console:

```
source("mammals/marsupials/koala/run_koala_code.R")
```

What do you notice happens? What can you also notice is the code in that R script we _sourced_ (you can directly click through in the Files Pane and open the R script itself to see!). Indeed, the Source button is merely a shortcut for using the `source()` function.


<br><br>
7. Finally, let's save a plot....

  + Copy/paste the code below into your script to make a faceted histogram of mammal awake times across vores (we're actually officially not learning the facet code until later this week, but [here it is anyways!](https://sjspielman.github.io/datascience_for_biologists/slides/ggplot2_slides.html#68))

    ```
    ggplot(msleep, aes(x = awake)) + 
      geom_histogram(color = "black") + 
      facet_wrap(~vore, nrow=2) -> awake_vore_hist
    ```

  + Make sure the plot was properly defined by printing the `awake_vore_hist` variable.
  + Use the [`ggsave()`](https://sjspielman.github.io/datascience_for_biologists/tutorials/readr_ggsave.html#Saving_your_ggplot2_plots) function to save the figure as a PNG file (extension `.png`) called: `mammal_histogram.png`. Specify two arguments: 1) the file name to save the plot in, 2) the variable the plot is saved in. (Very unfortunately, `ggsave()`'s arguments are the opposite order from `write_csv()`...). _Do not provide width/height arguments_, but pay attention to the output message `ggsave()` gives - it will tell you what dimensions it chose.
  + Download this file (same strategy you use to export your homework R scripts from cloud onto computer), and *open it on your computer to see how it looks.* The browser-based view for the figures can distort their size.
    + If you want to really up your game to "see how figures look," you may optionally insert the image into a Word or Google Doc. Seeing how the image appears relative to other text is a great indicator for "is my file the right size?"
  + Now, save it again as `mammal_histogram_large.png`, where you specify a width of 12 and a height of 8 to `ggsave()`. Again, download and look at the saved image on your computer.
  + Now, save it again as `mammal_histogram_small.png`, where you specify a width of 4 and a height of 2 to `ggsave()`. Again, download and look at the saved image on your computer.
  + Using your insights from the default size, the large size, and the small size, figure out the "right" size to save this file in. You may need more trial and error!!


<br><br>
8. More saving of plots! Using the final size you chose for the plot's aspect ratio, save the figure as `figures/mammal_histogram_final.png`. 

  + Before you write code, you must make sure the target out folder `figures/` actually exists - R won't create it for you, so you'll get an error about "could not open file" if you try to specify this output path without first ensuring `figures/` exists.
  + In the Files Pane, click "New Folder" and create the folder `figures/` in the working directory (ie, its *absolute path* should be `/cloud/project/figures/`). 
  + Now, save away!


<br><br>
9. Perform the same task again, except save in `mammals/mammals_histogram.pdf` (practicing both: saving in a different place, and saving in a different format: PDF!). _But, this time_...
  
  + The `mammals/` directory already exists, so there is no need to make it.
  + Define two variables just like you did for questions #2-3: One variable for the directory where we want to save the figure, and a second variable for what we want just the file name to be. 
  + Use `file.path()` to combine these variables and yield the complete relative path, and save the image to that completed relative path. 
  + Make sure the image file was created by looking in the Files pane.

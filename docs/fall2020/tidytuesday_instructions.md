---
output: pdf_document
geometry: margin=0.65in
---

# #TidyTuesday Extra Credit Instructions
BIOL01301, Data Science for Biologists
Fall 2020

## Relevant links:

+ `#TidyTuesday` github repository where datasets are posted: [`https://github.com/rfordatascience/tidytuesday`](https://github.com/rfordatascience/tidytuesday)

+ R4DataScience Online Learning Community Homepage: [`https://www.rfordatasci.com/`](https://www.rfordatasci.com/)

+ R4DataScience Twitter (they retweet #tidytuesday submissions): [`https://twitter.com/R4DScommunity`](https://twitter.com/R4DScommunity)

+ Twitter for R Programmers: [`https://www.t4rstats.com/`](https://www.t4rstats.com/) 

+ Link to previous `#DataScienceforBiologists` tweets: [`Click here`](https://twitter.com/search?q=%23datascienceforbiologists&src=typed_query)


## Instructions

The goal of this weekly extra credit is to develop your visualization and data wrangling skills along with the R4DS community. Each week (Monday evenings or Tuesday mornings), a new dataset is posted to the R4DS github account. Your task for extra credit will be to create a _reproducible figure_ using this data. You should feel welcome to use this opportunity to either work with particular skill or set of skills you feel you need more practice with, or to master a new skill that we didn't specifically cover in class or labs/assignments. 

**To obtain extra credit of a 1% boost to your OVERALL grade, you must do the following no later the following FRIDAY AT 11:59 PM from when the dataset was released.** Alternatively, if you complete the `#tidytuesday` by the following SUNDAY AT 11:59 PM from when the dataset was released, you will receive 0.5% extra credit.

+ Write reproducible (i.e. anyone should be able to successfully run it!) R code using `tidyverse` libraries to make a visualization of your choosing from the dataset. 
+ You should submit one of the following to Canvas:
  + A fully reproducible R script which creates *and saves using `ggsave()`* your figure.
  + A fully reproducible RMarkdown file which creates an embedded figure that is also *saved using `ggsave()`*.
  + Do NOT submit the saved figure to Canvas! I will run your code to create the figure file, which *must be fully visible with an appropriate aspect ratio!!*
+ You must release your code and figure publicly in one of the following ways:
	+ Tweet your figure and your reproducible code *from a PUBLIC TWITTER ACCOUNT* no later than the following Friday (or Sunday) at 11:59 pm. In your tweet you should tag me @stephspiel (or you can tag me in a reply to the main tweet, as long as I am tagged) and include the following two hashtags: `#tidytuesday` and `#DataScienceforBiologists`. 
	There are three options for including your code in the tweet:
		+ Upload the R script or Rmarkdown file directly as a tweet attachment (along with the figure)
		+ Include a link to an RStudio Cloud Project *in YOUR workspace, not the class workspace!* where permissions have been updated to allow anyone to view the code. To set these permissions, from within the project, click the gear icon on the top right. Click the "Access" button and make sure the permissions under "Who can view this project" are set to "Everyone." You can then include the link to the project (the actual URL) in your tweet.
	  + Indicate in your submission with a TEXT COMMENT (not in the script; a text comment in CANVAS) that you would like me to tweet on your behalf. In your comment, indicate if you would like to remain anonymous or not. If you would like to remain anonymous, make sure your R script does not have identifying features.


  
**You will NOT RECEIVE ANY CREDIT** if you do any of the following:

+ Use base R plotting or wrangling rather than `ggplot2` and `dplyr`/`tidyr` versions of code
+ Use the wrong week's dataset
+ Your figure is not reasonably well-formatted. The goal of this exercise is NOT to make the most beautiful figure as possible, but please don't actively attempt to make something hideous. **Follow best-practices from "Fundamentals of Data Visualization."** In addition, make sure the figure aspect ratio is appropriate. If your figure is not fully legible for any reason, you will not receive credit.
+ Submit code that is not fully reproducible. In other words, if I attempt to run your code and get an error of any kind, you will not receive credit.
+ Use code that you did not write. This will further subject you to AIV penalties.

 
 
 
 
 
 
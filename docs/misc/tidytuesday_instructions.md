---
output: pdf_document
geometry: margin=0.65in
---

# `#tidytuesday` Extra Credit Instructions
BIOL01301, Data Science for Biologists
Fall 2021

## Links you will need:

+ `#tidytuesday` github repository where datasets are posted: [`https://github.com/rfordatascience/tidytuesday`](https://github.com/rfordatascience/tidytuesday)

+ R4DataScience Online Learning Community Homepage: [`https://www.rfordatasci.com/`](https://www.rfordatasci.com/)

+ R4DataScience Twitter (they retweet `#tidytuesday` submissions): [`https://twitter.com/R4DScommunity`](https://twitter.com/R4DScommunity)

+ Twitter for R Programmers: [`https://www.t4rstats.com/`](https://www.t4rstats.com/) 

+ Twitter for Scientists: [`https://t4scientists.com/`](https://t4scientists.com/) 

+ Link to previous `#DataScienceforBiologists` tweets: [`Click here`](https://twitter.com/search?q=%23datascienceforbiologists&src=typed_query)


## Instructions - READ CAREFULLY!

The goal of this weekly extra credit is to develop your visualization and data wrangling skills along with the "R for Data Science" (R4DS) community. Each week (Monday evenings or Tuesday mornings), a new dataset is posted to the [R4DS github account](https://github.com/rfordatascience/tidytuesday). Your task for extra credit will be to create a _reproducible figure_ using this data. You should feel welcome to use this opportunity to either work with particular skill or set of skills you feel you need more practice with, or to master a new skill that we didn't specifically cover in class or labs/assignments. 

**To obtain extra credit of a _1%_ boost to your OVERALL grade, you must do the following no later the following FRIDAY AT 11:59 PM from when the dataset was released. Alternatively, if you complete the `#tidytuesday` by the following SUNDAY AT 11:59 PM from when the dataset was released, you will receive _0.5%_ extra credit. For the first week we do #tidytuesday, the full 1% credit will be a Sunday 11:59 PM deadline.**

+ Write reproducible (i.e. anyone should be able to successfully run it! _Don't ever include paths that only exist on your machine!_) R code using `tidyverse` libraries to make a visualization of your choosing from the dataset. 
+ You must submit to Canvas a fully reproducible RMarkdown file which creates an embedded figure that is also *saved using `ggsave()`* without any special paths - just the name of the file to save!
  + Do NOT submit the saved figure to Canvas! I will run your code to create the figure file, which *must be fully visible with an appropriate aspect ratio!!*
+ Your figure and code may be publicly tweeted, anonymously. Or, you can tweet yourself...
	+ Make sure you have a **PUBLIC** twitter account that you are comfortable using for professional networking purposes
	+ You must tweet no later than the following Friday (or Sunday) at 11:59 pm. 
	+ Make sure to tag me `@stephspiel` (or you can tag me in a reply to the main tweet, as long as I am tagged) and include the following two hashtags: `#tidytuesday` and `#DataScienceforBiologists`. 
	+ Include your figure as an attachment.
	+ To include your code, there are a few options:
	    + *Because you will have tagged me,* I will see your tweet and go ahead and reply with your code that you submitted on Canvas!
	    + You can upload the code to Google Drive, Dropbox, etc. and share a link to that code in the tweet.
  + If you suspect want to pursue graduate studies and/or a career that is even tangentially related to coding, I highly recommend tweeting for yourself to begin establishing a professional network. **Twitter is where all the academic networking lives.**
+ Please share your `#tidytuesday` figures with the class in the aptly Slack channel `#tidytuesday`!! Indeed, the purpose of this channel is to show each other your figures! This is not required, but it is fun.

  
### You will NOT RECEIVE ANY CREDIT if...

*But note: The sooner you submit, the sooner I can may be able you feedback about whether you should resubmit and fix some of these issues before the final deadlines to still get the extra credit.*
 

+ Use base R plotting or wrangling rather than `tidyverse` versions of code
+ Use the wrong week's dataset
+ Your figure is not reasonably well-formatted. The goal of this exercise is NOT to make the most beautiful figure as possible, but please don't actively attempt to make something hideous. **Follow best-practices from "Fundamentals of Data Visualization."** In addition, make sure the figure aspect ratio is appropriate. If your figure is not fully legible for any reason, you will not receive credit.
+ Submit code that is not fully reproducible. In other words, if I attempt to run your code and get an error of any kind, you will not receive credit. 
+ Use any of Spielman's Forbidden Script Code. Specifically, these should _never ever be in your Rmarkdown files_ (unless commented out):
  + `View()`
  + `install.packages()`
  + Redundant library loads. For example, if you have `library(tidyverse)`, you should not also have `library(ggplot2)`
+ **Use code that you did not write. This will further subject you to AIV penalties.** You will NOT have the opportunity to "fix-and-resubmit" unoriginal code. 

 
 
 
 
 
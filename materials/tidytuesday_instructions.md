---
output: pdf_document
geometry: margin=0.65in
---

# #TidyTuesday Extra Credit Instructions
BIOL01301, Data Science for Biologists
Spring 2020

## Relevant links:

+ `#TidyTuesday` github repository where datasets are posted: [`https://github.com/rfordatascience/tidytuesday`](https://github.com/rfordatascience/tidytuesday)

+ R4DataScience Online Learning Community Homepage: [`https://www.rfordatasci.com/`](https://www.rfordatasci.com/)

+ R4DataScience Twitter (they retweet #tidytuesday submissions): [`https://twitter.com/R4DScommunity`](https://twitter.com/R4DScommunity)


## Instructions

The goal of this weekly extra credit is to develop your visualization and data wrangling skills along with the R4DS community. Each week (monday evenings), a new dataset is posted to the R4DS github account. Your task for extra credit will be to create a _reproducible figure_ using this data. **To obtain extra credit of a 1% boost to your OVERALL grade, you must do the following no later the following SUNDAY AT 11:59 PM from when the dataset was released**:

+ Write reproducible (i.e. anyone should be able to successfully run it!) R code using `tidyverse` to make a visualization of your choosing from the dataset. *Your code must be in an RMarkdown document. The figure should both be displayed in the document AND saved as a stand-alone image.*
+ In your document, you should write one paragraph (3-6 sentences at the END) explaining how this particular #tidytuesday plot benefited you and improved your understanding of visualization or data wrangling concepts. For example, you should use this opportunity to either work with particular skill or set of skills you feel you need more practice with, or to master a new skill that we didn't specifically cover in class or labs/assignments. 
+ Release your Rmd file (or knitted) and figure publically in one of the following ways:
	+ Tweet your figure and your reproducible code no later than the following Sunday at 11:59 pm. In your tweet you should tag me @stephspiel (or you can tag me in a reply to the main tweet, as long as I am tagged) and include the following two hashtags: #tidytuesday and #DataScienceforBiologists. There are three options for including your code in the tweet:
		+ Upload the Rmd file directly as a tweet attachment (along with the figure)
		+ Include a link to an RStudio Cloud Project *in YOUR workspace, not the class workspace!* where permissions have been updated to allow anyone to view the code. To set these permissions, from within the project, click the gear icon on the top right. Click the "Access" button and make sure the permissions under "Who can view this project" are set to "Everyone." You can then include the link to the project (the actual URL) in your tweet.
		+ **For an extra 0.5%**: Create a github repository either for your #tidytuesday work. In the github repository, make a folder for each week's work, and save your code and figure in that week's folder. Make sure your github is publically accessible, and include links to the github code in your tweet. *It is NOT anticipated that you will choose this option before we learn github, which will happen soon!* If you elect this option, it will be best to include a list of links to all knitted #tidytuesday works in your README. This will be discussed in class.
	+ Email me your figure and your reproducible code to tweet on your behalf. In your email, indicate if you would like to remain anonymous or not. If you would like to remain anonymous, make sure your code does not have identifying features.

**You will NOT RECEIVE ANY CREDIT** if you do any of the following:

+ Use base R rather than `tidyverse` versions of code
+ Use the wrong week's dataset
+ Your figure is not reasonably well-formatted. The goal of this exercise is NOT to make the most beautiful figure as possible, but please don't actively attempt to make something hideous. Follow best-practices from "Fundamentals of Data Visualization." In addition, make sure the figure aspect ratio is appropriate. If your figure is not readable due to aspect ratio problems, you will not receive credit.
+ Submit code that is not fully reproducible. In other words, if I attempt to run your code and get an error of any kind, you will not receive credit.
+ Use code that you did not write. This will further subject you to AIV penalties.
+ Your code chunks are not revealed in the output, e.g. you may NOT USE `echo=F`, `include=F`, or anything that hides your code or its output.

 
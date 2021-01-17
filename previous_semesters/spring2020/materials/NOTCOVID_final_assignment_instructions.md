### Final Assignment Instructions (100 points)

> Proposal deadline: Monday April 27th at 11:59 pm on Blackboard. Late submissions deducted is 5% per day late (25 points total - no more than 5 days late!!)
>
> Assignment deadline: Tuesday May 12th at 11:59 pm as Pull Request (75 points)

For this assignment, you will find and analyze a dataset of your own choosing. Your task is pretty simple:

+ Ask **THREE** unique scientific questions about your dataset. Each question should be sufficiently different, and not previously analyzed in the dataset's source. 
	+ This is NOT a scientific question: "Perform a linear regression to explain variable Y by these four predictors."
	+ This IS a scientific question: "How do these four predictors explain variation in variable Y?"
+ Answer your three questions with compelling figures and a minimum of TWO different statistical analyses. In other words, each question should have an associated figure, and at least two of the questions should perform a statistical analysis to address the question. It is allowed for all three to have analyses - in this case, you may repeat one.
+ Analysis options include (can't do two of the same unless you have a _really_ comeplling reason, or you are doing three):
	+ Linear regression (with appropriate model evaluation that includes testing/training data and RMSE evaluation)	+ Logistic regression (with appropriate model evaluation that includes testing/training data and an ROC curve with reported AUC)
	+ PCA
	+ k-means clustering
	+ Another analysis of your choosing that MUST be approved by Spielman. Don't do this unless you know what you're doing.
+ For questions with a statistical analysis, the final "answer" figure can/should emerge directly from the analysis itself
+ You should include a 3-6 sentence (no more than 2 paragraphs if you have a lot to say) answer for each of your questions.

#### Proposal Instructions

1. Fork the final assignment repository, `sjspielman/datascience_final`. Create your named directory like for the midterm, and move the Rmarkdown project templates (proposal and project template) in to your named directory.

2. Find a dataset to analyze - it does NOT have to have anything to do with biology. Add it to your named directory

3. Fill in the proposal Rmarkdown with this **brief content**:
	+ Read in the data and shows `head()` (or similar!) output. You should accomplish reading in the dataset using a URL (see the linear regression tutorial for what this means). *Importantly*, the URL to read in is the URL associated with the RAW VIEW OF THE DATA ON GITHUB!!!
	+ Give a brief explanation as to what the data is, including its source, the URL of the source, and the date you obtained the data from that URL. *All three components are important!!*
	+ List the three scientific questions in bullet form. As sub-bullets, explain in 1-2 sentences how you will address the question, either with a statistical analysis or a type of figure. If the specifics of the figure aren't hammered out, that's ok!! I just need to see a general concept to determine whether your project will be appropriate and feasible.
	
4. Submit the **knitted HTML** (not the Rmd file) to Blackboard.

#### Assignment Instructions

1. Fill in the template and answer your questions! Should be pretty straightforward. Have fun with this!!

2. Your grade comes from....
	+ You need >=5 5 commits with informative messages
	+ You need to submit as pull request by the deadline
	+ NO errors that prevent knitting in your code
	+ NO library installs
	+ PROFESSIONAL code
	+ Appropriate use of the template 
	+ All plots (except any ROC curves or QQ plots) must be made with `ggplot()`
	+ Do YOUR OWN WORK!!

### Ideas for where to find data

0. Any previous dataset we have used in class, *provided you do not make the same figure or do the same analysis on it we did in class*
1. The tidy tuesday repository contains lots of datasets [https://github.com/rfordatascience/tidytuesday](https://github.com/rfordatascience/tidytuesday). You may choose a tidy tuesday dataset *provided you are not making a figure anything like one you made for an extra credit tidy tuesday submission*
2. The organization FiveThirtyEight maintains a repository with lots of datasets [https://github.com/fivethirtyeight/data](https://github.com/fivethirtyeight/data)
3. The javascript plotting library plotly's repository has lots of datasets (only focus on those that are CSV)! [https://github.com/plotly/datasets](https://github.com/plotly/datasets)
4. Any dataset you can get from [Gapminder](https://www.gapminder.org/data/)
5. Any dataset you can get from [Kaggle](https://www.kaggle.com/datasets) (note: you need a FREE account to get download these)
6. **If you know of another resource, please share it on Slack!** Many R packages have built-in data, if you happen to have explored another R package and know of a dataset it contains, for example?
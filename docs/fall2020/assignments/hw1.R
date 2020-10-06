##################################################################################################
## Homework 1
## Due WEDNESDAY 9/16/20 by 3:00 PM to Canvas 
## Provide your code AND associated comments in the space below each question.
## An EXAMPLE QUESTION with an AN EXAMPLE ANSWER is given to guide you. 
## Note that I refer to variable names and functions in questions with `backticks`, but you should NOT type these backticks when writing the code.
## Do NOT delete the questions! Please keep formatting as is. 
## ALL questions must PRINT an answer when the document is SOURCED! To print, you need to use the `print()` function!
## This document must run with "Source" without errors or bugs for full credit.
#################################################################################################

## Who are you -----------------------------------------------------------------

## Your name: 
## Names of friends you worked with:
# name here
# another name here
# maybe you did the hw alone, which is totally fine, so no need for names here!


## Example question -----------------------------------------------------------------


## EXAMPLE QUESTION: Add the numbers 5 and 6, and save the output to a variable call `five_and_six`. Then print the variable.
five_and_six <- 5 + 6  # add numbers and save to variable
print(five_and_six)    # print the variable


## Questions ------------------------------------------------------------------------


## Question 1: Define two variables x and y as values 10 and 15, respectively. Use a logical operator to ask if x is greater than y and print the output. The code should print TRUE if x is greater and FALSE if not.


## Question 2: Define two variables a and b as values 5 and 25, respectively. Use a logical operator and the function `sqrt()` to ask if a is equal to the square root of b and print the output. The code should print TRUE if they are equal and FALSE if not.


## Question 3: Define an array variable called `mammals` to contain the five strings: "cat", "dog", "elephant", "giraffe", and "marmoset". Use the function `length()` to determine how long the array is, and print the output. The code should print the length of the array.


## Question 4: Again consider the `mammals` array you created. Use the logical operator %in% to determine if the string "dog" is in the array, and print the output which will be either TRUE or FALSE.


## Question 5: Again consider the `mammals` array you created. Use the logical operator %in% to determine if the string "camel" is in the array, and print the output which will be either TRUE or FALSE.


## Question 6: Define an array variable called `amphibians` to contain the three strings: "frog", "salamander", and "newt." Use the function `length()` and a logical operator to compare the lengths of `mammals` and `amphibians`. Your code should print TRUE if mammals is longer, and FALSE if amphibians is longer.


## Question 7: This code creates an array variable named `question7` with the values 1-100: `question7 <- 1:100` (use this code in your answer, but again, dont copy/paste the backticks!). Use the THREE functions `mean()`, `median()`, and `sum()` to determine the average value, median value, and sum of values for each array. Each result should be SAVED to its own appropriately-named variable and printed out. In the end there should be THREE separately printed values.


## Question 8: Let's print a little fancier. There is a function `paste()` which will paste an ARRAY OF STRINGS together into a single string. Practice using and understanding the function by running the following lines of code (note: the "thinks" really mean "think about it" - you don't have to answer about your "thinking" but you can definitely tell me about it in a comment!) 
paste(c("word1", "word2", "word3"))
# This code won't work. think about why! - paste("word1", "word2", "word3")
word4 <- "wordfour"
paste(c("The variable word4 contains the value", word4))
paste(c("The variable word4 is not the same as the string", "word4"))
paste(c("words", "separated", "by", "exclamations"), sep = "!") # Use the argument `sep` to specify a different separator than just a space

# Use the `paste()` function and the MEAN VARIABLE you defined in question 7 to print fancier sentences saying "The mean of question7 is ...." where .... is the mean you calculated (not ....). There shoud be NO NUMBERS directly included in your code here. Hint: you still need to print what you pasted!


## Question 9: Using the same strategy for defining arrays as in question 7, define an array with the values 90-110 called `question9`. Calculate and save the mean of this new variable, and use a logical operator to ask if the mean of `question7` is greater to or equal than the mean of `question9`. When using the logical operator, compare VARIABLES not numbers directly! The code should print TRUE if `question7`'s mean is greater and FALSE otherwise.


## Question 10: Again consider the array `question9`. Use a logical operator to ask if values in this array are less than or equal to 100 (this is one quick line of code!). Print out the logical array your code creates.


## Question 11: For this question, you will teach yourself another new function called `seq()` by using the function and observing its behavior. Run the FOUR lines of code given below and closely examine the output. For your answer, provide a COMMENT that describes IN YOUR OWN WORDS what `seq()` does and what each of its three argument do.
seq(1,100,3)
seq(2,12,2)
seq(2,13,2)
seq(-20,-50,-5)

# Answer: ...

MOMv3.3.txt is really good for:
- recoding NA (they are -999)
- reference is a string, and it's absolutely vile. commas all around, some periods instead of commas, etc.
    + they'd have to design a regex to match it and then separate_rows with tidyr eeeeeeekkkkkk
> dat
# A tibble: 5,731 x 9
   continent status order family genus species log_body_mass adult_body_mass
   <chr>     <chr>  <chr> <chr>  <chr> <chr>           <dbl>           <dbl>
 1 AF        extant Arti… Bovid… Addax nasoma…          4.85          70000.
 2 AF        extant Arti… Bovid… Aepy… melamp…          4.72          52500.
 3 AF        extant Arti… Bovid… Alce… busela…          5.23         171002.
 4 AF        extant Arti… Bovid… Ammo… clarkei          4.45          28050.
 5 AF        extant Arti… Bovid… Ammo… lervia           4.68          48000 
 6 AF        extant Arti… Bovid… Anti… marsup…          4.59          39050.
 7 AF        extin… Arti… Bovid… Anti… bondi            4.53          34000 
 8 AF        extin… Arti… Bovid… Anti… austra…          4.6           40000 
 9 AF        extant Arti… Bovid… Bos   taurus           5.95         900000 
10 AF        extant Arti… Bovid… Capra walie            5            100000 
# … with 5,721 more rows, and 1 more variable: reference <chr>
> mean(dat$log_body_mass)
[1] -237.2709
> mean(dat$adult_body_mass)
[1] 153157
> summary(dat$adult_body_mass)
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
     -999         4        40    153157       776 190000000 
> summary(dat$log_body_mass)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-999.00    0.60    1.60 -237.27    2.89    8.28 


there should be a MINIMUM of 1 commit per question (@ completion)

they have to join mammalian life history and and MOMv3.3. 
for this there needs to be a variable in common but one does not necessarily exist. 
they'll have to create one that does
then they have can join them together(!!!)
then resplit apart to make it tidy again

then there are lots of NAs but they are coded differently in each data set. 
students will have to recode NAs replace_na and/or na_if and then remove them potentially



=======================================================

## Debugging
namespace
scope
hardcoding
meaningful variable names
traceback
watch jenny bryan probably right

=======================================================


## Working with missing data
replace_na()
na_if()
drop_na()

## Working with conditional mutation
if_else() ## MUST BE SAME TYPE
case_when()

## Working with more than one tibble
left_join/right_join
inner_join
anti_join
bind_cols()
bind_rows()

======================================================

(use planets.csv)

## Working with strings in stringr
str_to_upper()
str_to_lower()
str_to_title()
str_sort()
str_pad()
str_split()
str_detect() # returns T/F
str_count()
str_replace()
str_extract() # extract FIRST found - ALL TEXT
str_match() # regex version with group() and returns a motherfucking matrix?!
https://cran.r-project.org/web/packages/stringr/vignettes/stringr.html
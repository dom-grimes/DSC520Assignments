# Assignment: Exercise 4 #1
# Name: Grimes, Dominique
# Date: 2022-07-03

## Check your current working directory using `getwd()`
getwd()


## What are the observational units in this study?
## Load the file `data/scores.csv` to `section` using `read.csv`
## Examine the structure of `section` using `str()`
section <- read.csv("data/scores.csv", stringsAsFactors = TRUE)
str(section)
##    The observational units are 38 individual students.


## Identify the variables mentioned in the narrative paragraph and determine 
## which are categorical and quantitative?
class(section$Count)
class(section$Score)
class(section$Section)
##    The variables mentioned in the paragraph are Course Grades and 
##    Total Points (Count & Score), and Example Types by Section (Section).
##    Count is an integer; therefore, it is quantitative.
##    Score is an integer; therefore, it is quantitative.
##    Section is a factor; therefore, it is categorical.


##  Create one variable to hold a subset of your data set that contains only
##  the Regular Section and one variable for the Sports Section.
section.Regular <- subset(section, section$Section == "Regular")
section.Sports <- subset(section, section$Section == "Sports")


##  Use the Plot function to plot each Sections scores and the number of 
##  students achieving that score. Use additional Plot Arguments to label 
##  the graph and give each axis an appropriate label. 
plot(section.Regular$Score, section.Regular$Count, xlim=c(195,400),
     main="Scores in Regular Section",
     xlab = "Total Scores", ylab="Number of Scores")
plot(section.Sports$Score, section.Sports$Count, xlim=c(195,400),
     main="Scores in Sports Section",
     xlab = "Total Scores", ylab="Number of Scores")


##  Once you have produced your Plots answer the following questions:
##  Comparing and contrasting the point distributions between the two sections, 
##  looking at both tendency and consistency: 

##    Can you say that one section tended to score more points than the other? 
##    Justify and explain your answer.
stat.desc(section.Regular$Score, basic = FALSE, norm = TRUE)
#mode of section.Regular$Score = 350
stat.desc(section.Sports$Score, basic = FALSE, norm = TRUE)
#mode of section.Regular$Score = 335
##    The three measures of central tendency (mean, median, mode) for the 
##    regular section were higher than all three measures of central 
##    tendency of the sports section. The regular section data has less of a
##    spread or variance than the sports section, meaning the data is closer to
##    the center of the distribution, which is higher for the regular section.
##    This means there is a greater frequency of higher scores in the regular
##    section than the sports section.


##    Did every student in one section score more points than every student 
##    in the other section? NO
##    If not, explain what a statistical tendency means in this context.
##       The tendency or central tendency are a calculated values used to 
##       describe the middle or center of the distribution. The standard
##       deviation measures the amount of variability or variance in the data
##       from the center. Even though there was a tendency to score higher 
##       with greater probability in the regular section, this does not mean 
##       that all did well. Some students in the sports section had comparable 
##       high scores to the regular section, just not with as much frequency.


##    What could be one additional variable that was not mentioned in the 
##    narrative that could be influencing the point distributions between 
##    the two sections?
##        The first variable that came to mind was gender. There can be an
##        assumption that more males would sign up for the sports section
##        than females. The distribution look bimodal, which could potentially
##        be due to one distribution based on one gender and the other based on 
##        the opposite gender.

# Assignment: 
# Name: Grimes, Dominique
# Date: 2022-06-26

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/dgrimes/Documents/dsc520")

## Load the `acs-14-1yr-s0201.csv` to
survey_data <- read.csv("data/acs-14-1yr-s0201.csv")

str(survey_data)
nrow(survey_data)
ncol(survey_data)

## Histogram
ggplot(survey_data, aes(HSDegree)) + geom_histogram(binwidth = .75) +
  ggtitle("Frequency of Counties with High School Degrees") + 
  xlab("Population Percentage of High School Degrees per County") + 
  ylab("Number of Counties") 

## Histogram with normal curve
ggplot(survey_data, aes(HSDegree)) + 
  geom_histogram(aes(y = ..density..), binwidth = .5) + 
  stat_function(fun = dnorm, args = list(mean = mean(survey_data$HSDegree), sd = sd(survey_data$HSDegree)), size = 1)

install.packages('qqplotr')
library(qqplotr)
ggplot(survey_data, aes(sample = HSDegree)) + stat_qq_point() + stat_qq_line()

install.packages('pastecs')
library(pastecs)
stat.desc(survey_data)  

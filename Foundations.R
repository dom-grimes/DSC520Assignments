# Name: Grimes, Dominique
# Date: 2022-07-03

## Check current working directory using `getwd()`
getwd()
house.data <- read.csv("data/week-6-housing.csv", stringsAsFactors = TRUE)
str(house.data)
library(ggplot2)


## Use the apply function on a variable in your dataset
theMatrix <- matrix(house.data$Sale.Price, nrow = 12865, ncol = 1, 
                    byrow = FALSE, dimnames = NULL)
apply(theMatrix, 2, sum)


## Use the aggregate function on a variable in your dataset
aggregate(square_feet_total_living ~ building_grade, house.data, mean)


## Use the plyr function on a variable in your dataset – more specifically, 
## I want to see you split some data, perform a modification to the data, 
## and then bring it back together
library(plyr)
library(dplyr)
head(house.data)
## Calculate price per square foot
house.data2 <- house.data
house.data2 %<>% select(Sale.Price, square_feet_total_living) %>% 
  mutate(PricePerSqFt=Sale.Price/square_feet_total_living)
head(house.data2)
## Additional work (First attempt)
## Calculate price per square foot
house.data$ppsf <- with(house.data, (Sale.Price/square_feet_total_living))
tail(house.data)
## Create data frame
df <- data.frame(house.data$building_grade, house.data$ppsf)
head(df)
## Create Function
av.ppsf <- function(x) + {
  aggregate(house.data$ppsf ~ house.data$building_grade, df, mean)
}
## Use ddply function
ppsfbygrade <- ddply(df, .variables = "house.data$building_grade", 
                     .fun = av.ppsf)
head(ppsfbygrade)


## Check distributions of the data
ggplot(house.data2, aes(PricePerSqFt)) + 
  geom_histogram(aes(y = ..density..), binwidth = 25) + 
  stat_function(fun = dnorm, 
                args = list(mean = mean(house.data2$PricePerSqFt), 
                                         sd = sd(house.data2$PricePerSqFt)), 
                size = 1)
max(house.data2$PricePerSqFt)
## Distribution is positively skewed. Outliers are suspected.


## Identify if there are any outliers
PricePerSqFtBoxPlot2 <- ggplot(df, aes(house.data$building_grade, 
                                       house.data$PricePerSqFt))
PricePerSqFtBoxPlot2 + geom_boxplot()
## There are several outliers in the data. If analyzing further I would create
## a boxplot for each building grade. There seemed to be a data entry error in
## the data. Also some building grades had a much larger frequency of houses.


## Create at least 2 new variables
replace.Price.SqFt <- select(house.data, Sale.Price, square_feet_total_living) %>% 
  transmute(PricePerSqFt=Sale.Price/square_feet_total_living)
head(replace.Price.SqFt)

rename.zip <- select(house.data, zip5) %>% rename(Zip_Code=zip5)
head(rename.zip)

# Name: Grimes, Dominique
# Date: 2022-07-10

## Check current working directory and read and review file sructure.
getwd()
house.data <- read.csv("data/week-6-housing.csv", stringsAsFactors = TRUE)
str(house.data)

## Load initial libraries
library(dplyr)
library(magrittr)
library(lubridate)

## Using group_by, summarise, and arrange to summarize the average house
## sale price by year from lowest to highest.
formatdate <- strptime(house.data$Sale.Date, "%m/%d/%Y")
house.data %>% group_by(year(formatdate)) %>% 
  summarise(AvePrice = mean(Sale.Price)) %>%
  arrange(AvePrice)

## Using filter and select to identify houses larger than 2000 sqft and observe
## key data of interest such as year built, bedroom and bath count.
largehouse <- house.data %>% filter(square_feet_total_living > "2000")
selectlargehoue <- select(largehouse,'square_feet_total_living', 'year_built', 
                          'bedrooms', 'bath_full_count')
head(selectlargehoue)

## Using mutate to clearly state the age of the house as an added column.
house.data2 <- house.data
house.data2 %<>% mutate(year_built, Age=2022-year_built)
head(house.data2)

## Using purrr package with map and discard. Focusing on the year_renovated
## column to change the 0 values to NA, then discard the NA values.
library(purrr)
house.data$year_renovated[house.data$year_renovated==0]=NA
list.reno <- list(house.data$year_renovated)
map(list.reno, discard, is.na)

## Using purrr package with keep to keep year built later that 2000.
year.list <- house.data$year_built
keep(year.list, ~ .x > 2000)

## Using cbind to bind two databases together - bedrooms and bathrooms.
bedrooms <- as.data.frame(house.data$bedrooms)
bathrooms <- house.data
bathrooms %<>% select(bath_full_count, bath_half_count, bath_3qtr_count) %>% 
  transmute(bath=bath_full_count + bath_half_count + bath_3qtr_count)
bed.bath <- cbind(bedrooms, bathrooms)
str(bedrooms)
str(bathrooms)
str(bed.bath)

## Using filter to obtain two databases - 4 br houses & houses with 3+ full bath
## Using rbind to bind these two databases.
bed2 <- house.data %>% filter(bedrooms == "4")
bath2 <- house.data %>% filter(bath_full_count >= "3")
largebedbath <- rbind(bed2, bath2)
str(bed2)
str(bath2)
str(largebedbath)

## Created a message vector. Utilized paste & collapse to concatenate and
## str_split to split.
library(stringr)
message <- c("It", "is", "a", "great", "day!")
paste(message, collapse = " ")
str_split(message, pattern = " ")


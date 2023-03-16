#### Preamble ####
# Purpose: Cleans.... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Data: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(haven)
library(tidyverse)
library(dplyr)

#### Clean data ####
raw_data <- read_dta("inputs/data/GSS2021.dta")

raw_data <-
  labelled::to_factor(raw_data)

raw_data <- 
  raw_data %>% 
  select(mapres10,papres10,paeduc,maeduc,educ)

#change class
raw_data$mapres10 <- as.character(raw_data$mapres10)
raw_data$papres10 <- as.character(raw_data$papres10)
raw_data$maeduc <- as.character(raw_data$maeduc)
raw_data$paeduc <- as.character(raw_data$paeduc)
raw_data$educ <- as.character(raw_data$educ)

#change no formal to 0
raw_data<-raw_data%>%mutate_all(~ifelse(. == "no formal schooling", 0, .))%>%
  mutate_all(as.numeric)

#group variables into levels



#### Save data ####
# [...UPDATE THIS...]
# change cleaned_data to whatever name you end up with at the end of cleaning
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")


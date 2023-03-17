#### Preamble ####
# Purpose: Data cleaning for GSS 2021
# Author: Ruibo Sun
# Data: 16 March 2023
# Contact: ruibo.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download all the packges under the Workspace section
# Any other information needed? None


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
  dplyr::select(mapres10,papres10,paeduc,maeduc,educ,mawrkslf,pawrkslf,degree,born,sex,reg16,incom16)

#change class
raw_data$mapres10 <- as.character(raw_data$mapres10)
raw_data$papres10 <- as.character(raw_data$papres10)
raw_data$maeduc <- as.character(raw_data$maeduc)
raw_data$paeduc <- as.character(raw_data$paeduc)
raw_data$educ <- as.character(raw_data$educ)

# Replace "no formal schooling" with 0 in the specified column
raw_data$educ[raw_data$educ== "no formal schooling"] <- 0
raw_data$maeduc[raw_data$maeduc== "no formal schooling"] <- 0
raw_data$paeduc[raw_data$paeduc== "no formal schooling"] <- 0

# Change to numeric
raw_data$mapres10 <- as.numeric(raw_data$mapres10)
raw_data$papres10 <- as.numeric(raw_data$papres10)
raw_data$maeduc <- as.numeric(raw_data$maeduc)
raw_data$paeduc <- as.numeric(raw_data$paeduc)
raw_data$educ <- as.numeric(raw_data$educ)

#group variables into levels

mepa<-median(raw_data$papres10,na.rm=TRUE)
mema<-median(raw_data$mapres10,na.rm=TRUE)

raw_data <- raw_data %>%
  mutate(father_factor = case_when(
    papres10 < mepa ~ "Lower than Median",
    papres10 >= mepa ~ "Above and Equal to Median"
  ))

raw_data <- raw_data %>%
  mutate(mother_factor = case_when(
    mapres10 < mema ~ "Lower than Median",
    mapres10 >= mema ~ "Above and Equal to Median"
  ))

cleaned_data<-raw_data

#### Save data ####
# [...UPDATE THIS...]
# change cleaned_data to whatever name you end up with at the end of cleaning
write_csv(cleaned_data, "inputs/data/GSS2021 2.csv")


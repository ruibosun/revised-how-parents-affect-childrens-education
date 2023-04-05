#### Preamble ####
# Purpose: Data cleaning for GSS 2021
# Author: Ruibo Sun
# Date: 16 March 2023
# Contact: ruibo.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download all the packges under the Workspace section and read the 2021 General Social Survey data.
# Any other information needed? None


#### Workspace setup ####
library(haven)
library(tidyverse)
library(dplyr)
library(mice)

#### Clean data ####
raw_data <- read_csv("inputs/data/raw_data.csv")

raw_data <- 
  raw_data %>% 
  dplyr::select(mapres10,papres10,paeduc,maeduc,educ,degree,born,reg16,incom16)


# Columns to process
cols_to_process <- c("mapres10", "papres10", "maeduc", "paeduc", "educ")

# Loop through columns and process
for (col in cols_to_process) {
  # Change to character
  raw_data[[col]] <- as.character(raw_data[[col]])
  
  # Replace "no formal schooling" with 0
  raw_data[[col]][raw_data[[col]] == "no formal schooling"] <- 0
  
  # Change to numeric
  raw_data[[col]] <- as.numeric(raw_data[[col]])
}

# check the NAs
apply(X = is.na(raw_data), MARGIN = 2, FUN = sum)

# deal with the NAs that are numerical
multiple_imputation <-
  mice(raw_data,
    print = FALSE
  )
mice_estimates <-
  complete(multiple_imputation) |>
  as_tibble()
mice_estimates

# deal with the NAs that are categorical--remove 
mice_estimates <- mice_estimates %>% filter(complete.cases(degree, born, reg16, incom16))

cleaned_data<-mice_estimates

#group variables into levels
mepa<-median(cleaned_data$papres10,na.rm=TRUE)
mema<-median(cleaned_data$mapres10,na.rm=TRUE)

cleaned_data <- cleaned_data %>%
  mutate(father_factor = case_when(
    papres10 < mepa ~ "Lower than Median",
    papres10 >= mepa ~ "Above and Equal to Median"
  ))

cleaned_data <- cleaned_data %>%
  mutate(mother_factor = case_when(
    mapres10 < mema ~ "Lower than Median",
    mapres10 >= mema ~ "Above and Equal to Median"
  ))

#### Save data ####
write_csv(cleaned_data, "inputs/data/cleaned_GSS2021.csv")



#### Preamble ####
# Purpose: Download the data from GSS 2021
# Author: Ruibo Sun
# Date: 12 April 2023
# Contact: ruibo.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download all the packges under the Workspace section
# Any other information needed? None


#### Workspace setup ####
library(haven)
library(tidyverse)

#### Download data ####
raw_data <- read_dta("inputs/data/GSS2021.dta")

raw_data <-
  labelled::to_factor(raw_data)


#### Save data ####
write_csv(raw_data, "inputs/data/raw_data.csv") 

         
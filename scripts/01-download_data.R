#### Preamble ####
# Purpose: Download the data from GSS 2021
# Author: Ruibo Sun
# Date: 16 March 2023
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
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_data, "inputs/data/raw_data.csv") 

         
#### Preamble ####
# Purpose: Data cleaning for GSS 2021
# Author: Ruibo Sun
# Data: 16 March 2023
# Contact: ruibo.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download all the packges under the Workspace section
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(123) # set seed for reproducibility

# generate 100 observations
n <- 100 

# generate parents' education level, with higher levels of education having a greater probability of occurrence
parent_edu <- sample(c("less than high school", "high school", "some college", "bachelor's degree", "graduate degree"), 
                     n, 
                     replace = TRUE)

# generate a binary variable indicating whether parents have higher education or not
parent_higher_edu <- ifelse(parent_edu %in% c("bachelor's degree", "graduate degree"), 1, 0)

# generate children's education, with higher probability of occurrence if parents have higher education
child_edu <- sample(c("less than high school", "high school", "some college", "bachelor's degree", "graduate degree"), 
                    n, 
                    replace = TRUE)

# generate a binary variable indicating whether children have higher education or not
child_higher_edu <- ifelse(child_edu %in% c("bachelor's degree", "graduate degree"), 1, 0)

# generate a variable indicating region of living during teenage age, with equal probability of occurrence
region <- sample(c("North", "South", "East", "West"), n, replace = TRUE)

# generate a random prestige score for parents, with higher education level and living in certain regions associated with higher scores
prestige_score <- ifelse(parent_edu %in% c("bachelor's degree", "graduate degree"), 
                         rnorm(n, mean = 75, sd = 15), 
                         rnorm(n, mean = 50, sd = 10))
prestige_score <- ifelse(region == "East", prestige_score + rnorm(n, mean = 10, sd = 5), prestige_score)
prestige_score <- ifelse(region == "West", prestige_score - rnorm(n, mean = 10, sd = 5), prestige_score)

# create a data frame with the generated variables
simulated_data <- data.frame(parent_edu, parent_higher_edu, child_edu, child_higher_edu, region, prestige_score)






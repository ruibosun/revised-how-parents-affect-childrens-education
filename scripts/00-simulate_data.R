#### Preamble ####
# Purpose: Data Simulation for the paper of "The Relationship between Family Status and Academic Achievement in Children"
# Author: Ruibo Sun
# Date: 12 April 2023
# Contact: ruibo.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(123)
n <- 100

# Generate individual variables
parent_edu <-
  sample(
    c(
      "less than high school",
      "high school",
      "some college",
      "bachelor's degree",
      "graduate degree"
    ),
    n,
    replace = TRUE
  )

parent_higher_edu <-
  ifelse(parent_edu %in% c("bachelor's degree", "graduate degree"), 1, 0)

child_edu <-
  sample(
    c(
      "less than high school",
      "high school",
      "some college",
      "bachelor's degree",
      "graduate degree"
    ),
    n,
    replace = TRUE
  )

child_higher_edu <-
  ifelse(child_edu %in% c("bachelor's degree", "graduate degree"), 1, 0)

region <-
  sample(c("North", "South", "East", "West"), n, replace = TRUE)

prestige_score <-
  ifelse(
    parent_edu %in% c("bachelor's degree", "graduate degree"),
    rnorm(n, mean = 75, sd = 15),
    rnorm(n, mean = 50, sd = 10)
  )
prestige_score <-
  ifelse(region == "East",
         prestige_score + rnorm(n, mean = 10, sd = 5),
         prestige_score)
prestige_score <-
  ifelse(region == "West",
         prestige_score - rnorm(n, mean = 10, sd = 5),
         prestige_score)

# Pull them together in a tibble
simulated_data <-
  tibble(parent_edu,
         parent_higher_edu,
         child_edu,
         child_higher_edu,
         region,
         prestige_score)

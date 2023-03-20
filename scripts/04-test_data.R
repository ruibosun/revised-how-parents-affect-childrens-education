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
cleaned_data <- read_csv(
  file = here("inputs/data/GSS2021 2.csv"))

#### Test data ####
cleaned_data$mapres10|> class() == "numeric"

cleaned_data$papres10|> class() == "numeric"

cleaned_data$paeduc|> class() == "numeric"

cleaned_data$maeduc|> class() == "numeric"

cleaned_data$educ|> class() == "numeric"

cleaned_data$mawrkslf|> class() == "character"

cleaned_data$pawrkslf|> class() == "character"

cleaned_data$degree|> class() == "character"

cleaned_data$born|> class() == "character"

cleaned_data$sex|> class() == "character"

cleaned_data$degree|> class() == "character"

cleaned_data$incom16|> class() == "character"

cleaned_data$reg16|> class() == "character"

cleaned_data$maeduc|> min(na.rm = T) >= 0

cleaned_data$paeduc|>min(na.rm = T) >= 0

cleaned_data$educ|>min(na.rm = T) >= 0

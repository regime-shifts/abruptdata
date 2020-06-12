## This script is a template for adding data to the r package regime-shifts-abruptdata
## An example using R package `datasets` is provided here.
## For an example importing the data from .csv or .txt, please see groundfish-data.R

# Import the original data ---------------------------------------------------------
## Preferably, the data will be imported via URL and download from a permanent archive within a trusted digital repository
## However, if this is not possible, please add the dataset to directory /data-raw/ as .csv or .txt

DATASET <- as_tibble(datasets::beaver2)

# Munging -------------------------------------------------------
## Munge or clean the data as necessary
# create a new variable which adds 2400 hours (1 day) to the values with day==308
DATASET$time.new <- ifelse(DATASET$day == 307, DATASET$time, DATASET$time+2400)


# Naming convention -------------------------------------------------------
## We follow the following naming convention for variables of interest to be used in analysis in R package regime-shfits/abrupt
## The following columns are required, and additional columns can be retained but will not be used in analysis:
### time:
### lat:
### long:
###

 
  

# Save the data as .rda ---------------------------------------------------
usethis::use_data(DATASET, overwrite = TRUE)

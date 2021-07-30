# ## This script is a template for adding data to the r package regime-shifts-abruptdata
# ## An example using R package `datasets` is provided here.
# ## For an example importing the data from .csv or .txt, please see groundfish-data.R
#
# # Import the original data ---------------------------------------------------------
# ## Preferably, the data will be imported via URL and download from a permanent archive within a trusted digital repository
# ## However, if this is not possible, please add the dataset to directory /data-raw/ as .csv or .txt
#
# DATASET <- as_tibble(datasets::beaver2)
#
# # Munging -------------------------------------------------------
# ## Munge or clean the data as necessary
# ## The data should be in a LONG format
#
# # For this example dataset, we need to create a new variable which adds 2400 hours (1 day) to the values with day==308, such that we have a single, temporal variable along which the methods are analysed
# DATASET$time.new <-
#   ifelse(DATASET$day == 307, DATASET$time, DATASET$time + 2400)
#
# # Remove unnecessary columns. This is opitonal.
# DATASET <- DATASET %>%
#   dplyr::select(time.new, temp)
#
# # Naming convention -------------------------------------------------------
# ## We follow the following naming convention for variables of interest to be used in analysis in R package regime-shfits/abrupt
# ## The following columns are required, and additional columns can be retained but will not be used in analysis:
# ### time:      If the data has a temporal component and will be analysed along the temporal component, please provide this column
# ### lat:       If spatial coordinates exist, please convert to latitude using WGS 84
# ### long:if    Spatial coordinates exist, please convert to longitude using WGS 84
# ### variable:  The variable(s) of interest. this will usually be species names or identifiers
# ### value:     The response value; an observation of the 'variable'
# ### site:      If sites exist, please include them as a single variable
#
# DATASET <- DATASET %>%
#   dplyr::rename(time = time.new,
#                 value = temp)
#
# # Save the data as .rda ---------------------------------------------------
# # usethis::use_data(DATASET, overwrite = TRUE) # uncomment this line and run it.

## This script prepares the `groundfish` datasets for use in R package `regime-shifts/abrupt``

# Import the original data ---------------------------------------------------------
## Preferably, the data will be imported via URL and download from a permanent archive within a trusted digital repository
## However, if this is not possible, please add the dataset to directory /data-raw/ as .csv or .txt
gf_spatial_info <- read.csv("data-raw/groundfish_spatial_info.csv") # spatial information
gf_spatiotemporal <- read.csv("data-raw/groundfish_spatiotemporal.csv") # spatiotemporal

# append the spatial information to the spatiotemporal data
groundfish <- merge(gf_spatial_info, gf_spatiotemporal)

#

# save the data as .rda in directory ./data/
usethis::use_data(groundfish, overwrite = TRUE)


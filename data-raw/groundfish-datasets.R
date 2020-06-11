## code to prepare `groundfish` datasets

# Import the original data
gf_spatial_info <- read.csv("data-raw/groundfish_spatial_info.csv") # spatial information
gf_spatiotemporal <- read.csv("data-raw/groundfish_spatiotemporal.csv") # spatiotemporal

# append the spatial information to the spatiotemporal data
groundfish <- merge(gf_spatial_info, gf_spatiotemporal)

# save the data as .rda in directory ./data/
usethis::use_data(groundfish, overwrite = TRUE)


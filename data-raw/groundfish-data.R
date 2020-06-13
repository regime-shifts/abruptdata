## This script  prepares the 'groundfish' data

# Import the original data ---------------------------------------------------------
gf_spatial_info <- read.csv("data-raw/groundfish_spatial_info.csv") # spatial information
gf_spatiotemporal <- read.csv("data-raw/groundfish_spatiotemporal.csv") # spatiotemporal


# Munging -----------------------------------------------------------------
# append the spatial information to the spatiotemporal data
groundfish <- merge(gf_spatial_info, gf_spatiotemporal) %>% as_tibble()


# Naming convention -------------------------------------------------------
groundfish<-groundfish %>%
  dplyr::rename(time=year,
         value=weight_kg,
         long=longitude,
         lat=latitude,
         site=stratum,
         variable=taxa_name
         )

# Save the data as .rda ---------------------------------------------------
usethis::use_data(groundfish, overwrite = TRUE)




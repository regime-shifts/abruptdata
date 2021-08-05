## This script  prepares the 'groundfish' dataset used in Pedersen et al. YYYY.
## The data was provided by E. Pedersen.

# Import the original data ---------------------------------------------------------
spatial <- read.csv("data-raw/groundfish_spatial_info.csv") # spatial information
spattemp <- read.csv("data-raw/groundfish_spatiotemporal.csv") # spatiotemporal

# append the spatial information to the spatiotemporal data
data <- merge(spatial, spattemp)


# Pull in lookup table --------------------------------------------------------
attributes <- read.csv("data-raw/metadata/attributes-groundfish-pedersen.csv")

# Define citation ---------------------------------------------------------
df.citation <- "TBA"

# Munge data to conform to package standards ------------------------------
groundfish <- munge_dataset(data, attributes, df.citation)


# Save the data as .rda ---------------------------------------------------
usethis::use_data(groundfish, overwrite = TRUE)




### konza_fire dataset


# Script for downloading and munging the dataset used in Ratajczak et al. (2017)
# DATA: https://datadryad.org/stash/dataset/doi:10.5061/dryad.h45mr


# Download the data ---------------------------------------------------
url <- "https://datadryad.org/stash/downloads/file_stream/40212"
tempfn <- tempfile()
download.file(url, destfile = tempfn)

# Import files --------------------------------------------------------
data <- read.csv(tempfn) # the original data
attributes <- read.csv("data-raw/metadata/attributes-fire-konza-ratajczak.csv")

# Munge the data according to attributes table ----------------------------
fire_konza_ratajczak <- munge_dataset(data, attributes)

# Save to package ---------------------------------------------------------
usethis::use_data(fire_konza_ratajczak, overwrite = TRUE)

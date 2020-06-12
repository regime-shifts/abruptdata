## This script is a template for adding data to the r package regime-shifts-abruptdata
## An example using R package `datasets` is provided here.
## For an example importing the data from .csv or .txt, please see groundfish-data.R

# Import the original data ---------------------------------------------------------
## Preferably, the data will be imported via URL and download from a permanent archive within a trusted digital repository
## However, if this is not possible, please add the dataset to directory /data-raw/ as .csv or .txt

seddon <- as_tibble(read.csv("data-raw/seddon2014.csv", header=TRUE))
# Relevant columns in the original data include:
    # Depth         - depth in cm
    # Age           - calibrated ages
    # AchSp2-UnkSp1 - Diatom species proportions.
    # Ti            - Ti influx (µg/cm^2/yr). Sampled 1-cm down from diatom data and linearly interpolated to same sampling intervals prior to analyses.
    # d13C 	      -	Stable carbon isotope data (per mille, ‰) from Seddon et al. 2011. Note that data handling errors identified from Seddon et al. 2011 corrected.


# Munging and follow package naming convention -------------------------------------------------------
seddon2014 <- seddon %>%
  dplyr::select(-Depth) %>%
  tidyr::gather(variable, value, -Age) %>%
  dplyr::rename(time = Age) %>%
  dplyr::mutate(site = "Diablas")

# Save the data as .rda ---------------------------------------------------
usethis::use_data(seddon2014, overwrite = TRUE)


# Add the data description to R/data.R  --------------------------------



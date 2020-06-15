## This script is a template for adding data to the r package regime-shifts-abruptdata
## An example using R package `datasets` is provided here.
## For an example importing the data from .csv or .txt, please see groundfish-data.R


# About the data ----------------------------------------------------------
## This data was retrieved from publication and can be retrieved directly <URL/doi>.
## The metadata for this data is provided following the EML at <url>.

# Brief overview of the data.

# Import the original data ---------------------------------------------------------
seddon <- as_tibble(read.csv("data-raw/seddondiatoms.csv", header=TRUE))
# Relevant columns in the original data include:
    # Depth         - depth in cm
    # Age           - calibrated ages
    # AchSp2-UnkSp1 - Diatom species proportions.
    # Ti            - Ti influx (µg/cm^2/yr). Sampled 1-cm down from diatom data and linearly interpolated to same sampling intervals prior to analyses.
    # d13C 	      -	Stable carbon isotope data (per mille, ‰) from Seddon et al. 2011. Note that data handling errors identified from Seddon et al. 2011 corrected.
# Numerous other columns exist.

# Munging and follow package naming convention -------------------------------------------------------
seddondiatoms <- seddon %>%
  dplyr::select(-Depth) %>%
  tidyr::gather(variable, value, -Age,-Ti, -d13C) %>%
  dplyr::rename(time = Age) %>%
  dplyr::mutate(site = "Diablas")

# Save the data as .rda ---------------------------------------------------
usethis::use_data(seddondiatoms, overwrite = TRUE)



# Import the original data ---------------------------------------------------------
seddon <- read.csv("data-raw/seddondiatoms.csv", header=TRUE)
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



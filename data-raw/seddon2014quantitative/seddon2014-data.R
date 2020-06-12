# code to prepare 'seddon2014quantitative' data
#
# A data frame from [1] (https://figshare.com/collections/A_quantitative_framework_for_analysis_of_regime_shifts_in_a_Gal_pagos_coastal_lagoon/3307191/1)
# [1] seddon2014quantitative (identifier from the google sheet)

# Read in the original data
core <- read.csv("data-raw/seddon2014quantitative/data.csv", header=T)
# Depth         - depth in cm
# Age           - calibrated ages
# AchSp2-UnkSp1 - Diatom species proportions.
# Ti            - Ti influx (µg/cm^2/yr). Sampled 1-cm down from diatom data and linearly interpolated to same sampling intervals prior to analyses.
# d13C 	      -	Stable carbon isotope data (per mille, ‰) from Seddon et al. 2011. Note that data handling errors identified from Seddon et al. 2011 corrected.

seddon2014quantitative <- core %>%
  dplyr::select(-Depth) %>%
  gather(variable, value, -Age) %>%
  rename(time = Age) %>%
  mutate(site = "Diablas") %>%
  as_tibble()

# save the data as .rda in directory ./data/
usethis::use_data(seddon2014quantitative, overwrite = TRUE)

## This script prepares the everglades dataset on macroinvertebrate species composition
# along a surface-water total phosphorus gradient
# used in Baker & King 2010 (https://www.doi.org/10.1111/j.2041-210X.2009.00007.x)

# Variable Metadata -------------------------------------------------------
    ## column desriptions and units
    # TP.ugL: surface-water total phosphorus in micrograms/liter
    # site: name of sampling station
    # variable: macroinvertebrate taxa names
    # value: macroinvertebrate densities in number/meter-squared


# Provide citation --------------------------------------------------------

# df.citation <- "CITATION GOES HERE"

# Import the original data ---------------------------------------------------------
everglades.env <- read.table("data-raw/everglades_env.txt")
everglades.taxa <- read.table("data-raw/everglades_taxa.txt")


# Load attributes ---------------------------------------------------------
attributes <- read.csv("data-raw/metadata/attributes-everglades-baker.csv")

# Pre-munging the observations dataset -------------------------------------------------------
## add row names as column
everglades.env$site <- rownames(everglades.env)
everglades.taxa$site <- rownames(everglades.taxa)

## combine data and convert to long format
data <- everglades.env %>%
  # join taxa with environemntal variables
  dplyr::left_join(everglades.taxa, by="site") %>%
  # remove punctuation and spaces from site names
  dplyr::mutate(site = gsub("[ [:punct:]]", "",site)) %>%
 # force site to factor
  dplyr::mutate(site=as.factor(site)) %>%
  tidyr::pivot_longer(c(-TP.ugL, -site), names_to="taxa", values_to="values")

# Create package standard dataset -----------------------------------------
everglades <- munge_dataset(data, attributes)

# Save the data as .rda ---------------------------------------------------
usethis::use_data(everglades, overwrite = TRUE) # uncomment this line and run it.

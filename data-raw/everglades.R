## This script prepares the everglades dataset on macroinvertebrate species composition
# along a surface-water total phosphorus gradient
# used in Baker & King 2010 (https://www.doi.org/10.1111/j.2041-210X.2009.00007.x)

# Import the original data ---------------------------------------------------------

everglades.env <- read.table("data-raw/everglades_env.txt")
everglades.taxa <- read.table("data-raw/everglades_taxa.txt")

# Munging -------------------------------------------------------
## add row names as column
everglades.env$site <- rownames(everglades.env)
everglades.taxa$site <- rownames(everglades.taxa)

## combine data and convert to long format
everglades <- everglades.env %>%
  # join and convert to tibble
  left_join(everglades.taxa, by="site") %>%
  as_tibble() %>%
  # long form
  pivot_longer(cols=c(ABLARHAM:ZAVRMARM), names_to="variable", values_to="value") %>%
  # remove punctuation and spaces from site names
  mutate(site = gsub("[ [:punct:]]", "",site)) %>%
  # add generic name for sort column
  rename(gradient = TP.ugL)

# Save the data as .rda ---------------------------------------------------
# usethis::use_data(everglades, overwrite = TRUE) # uncomment this line and run it.


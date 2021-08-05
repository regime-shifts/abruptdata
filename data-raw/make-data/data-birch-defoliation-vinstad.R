# # Data preparation for the Vinstad et al. Birch forest defoliation
#
# ## This data is downloaded from doi:10.5061/dryad.1nm650h.
# ## The dryad stash contains a data preparation script called,
# ## "Rscript_all_analyzes_pub.R", which is not implemented here.
#
# ## IMPORTANT NOTE FOR ABUPRT DEV:
#     ## This data is not representative of the data used in their analyses.
#     ## If we want to use this dataset, we need to go through their R script (see above)
#         ## and munge according to their use.
#
# # Download the data ---------------------------------------------------
# doi <- "10.5061/dryad.1nm650h"
# # Currently, I don't see a way to force dryad_download() to allow us to specify a dir. So using this annoying workaround.
# fns <- rdryad::dryad_download("10.5061/dryad.1nm650h")
# fns <- unlist(fns) %>% as.vector() # coerce to vector of strings to be able to query for file names
# # Remove readme files because we do not want to pull in.
# fns <- fns[stringr::str_detect(fns, "README", negate = TRUE)]
#
# # Pull in data files per Vinstad et al. 2019 R from Dryad ---------------
# # defoliation <- read.delim(fns[stringr::str_detect(fns, "defoliation")])
# for10 <- read.delim(fns[stringr::str_detect(fns, "2010")])
# for16 <- read.delim(fns[stringr::str_detect(fns, "2016")])
#
#
# # Munge the forest data. --------------------------------------------------
#
#
#
# # Specify citation --------------------------------------------------------
# # this citation was copied from Dryad 2021-08-05
# df.citation <- "Vindstad, Ole Petter Laksforsmo et al. (2019), Data from: Can novel pest outbreaks drive ecosystem transitions in northern-boreal birch forest?, Dryad, Dataset, https://doi.org/10.5061/dryad.1nm650h"
#
# # Import files --------------------------------------------------------
# attributes <- read.csv("data-raw/metadata/attributes-birch-defoliation-vinstad.csv")
#
# # Munge the data according to attributes table ----------------------------
# birch_vinstad <- munge_dataset(for.stand, attributes, df.citation)
#
# # Save to package ---------------------------------------------------------
# usethis::use_data(fire_konza, overwrite = TRUE)

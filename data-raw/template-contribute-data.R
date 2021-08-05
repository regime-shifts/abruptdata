# # Download the data ---------------------------------------------------
# url <- "permanent url/uri to file download"
# tempfn <- tempfile()
# download.file(url, destfile = tempfn)
#
# # Import files --------------------------------------------------------
# data <- read.csv(tempfn) # the original data
# attributes <- read.csv("data-raw/metadata/attributes-system-locale-leadauth.csv")
#
# # Define citation for data -----------------------------------------------
# cite.bib = "Paste .bib style citation here."
#
# # Munge the dataset to conform to package standards ----------------------------
# system_locale <- munge_dataset(data,
#                                    attributes,
#                                    df.citation = cite.bib)
#
# # Save to package ---------------------------------------------------------
# usethis::use_data(system_locale, overwrite = TRUE)
#

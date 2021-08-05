# Download the data ---------------------------------------------------
url <- "https://ndownloader.figshare.com/files/5632203"
tempfn <- tempfile()
download.file(url, destfile = tempfn)

# Import files --------------------------------------------------------
data <- read.csv(tempfn) # the original data
attributes <- read.csv("data-raw/metadata/attributes-diatoms-galapagos-seddon.csv")

# Define citation for data -----------------------------------------------
cite.bib = "@misc{w. r. seddon_a. froyd_witkowski_j. willis_2016, title={Supplement 1. Annotated R scripts and sediment core data used to investigate regime shift dynamics in a Galapagos coastal lagoon.}, url={https://wiley.figshare.com/articles/dataset/Supplement_1_Annotated_R_scripts_and_sediment_core_data_used_to_investigate_regime_shift_dynamics_in_a_Galapagos_coastal_lagoon_/3560655/1}, DOI={10.6084/m9.figshare.3560655.v1}, publisher={Wiley}, author={W. R. Seddon, Alistair and A. Froyd, Cynthia and Witkowski, Andrzej and J. Willis, Katherine}, year={2016}, month={Aug} } "

# Munge the dataset to conform to package standards ----------------------------
diatoms_galapagos <- munge_dataset(data,
                                   attributes,
                                   df.citation = cite.bib)

# Save to package ---------------------------------------------------------
usethis::use_data(diatoms_galapagos, overwrite = TRUE)


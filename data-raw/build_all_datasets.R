# Run this script to source/update all datasets in the package before building package.
library(dplyr)
library(stringr)
library(magrittr)

# Source all functions first ----------------------------------------------
funs <- list.files("R", full.names = TRUE)
sapply(funs,source,.GlobalEnv)


# Build all the datasets --------------------------------------------------
fns <- list.files("data-raw/make-data", full.names = TRUE)
sapply(fns,source,.GlobalEnv)





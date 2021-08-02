# This script runs automatically on build
# It updates all internal datasets and documentation
fns <- list.files("data-raw", pattern=".R", full.names = TRUE)

sapply(fns, source)





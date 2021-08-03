#' @title A Function to Help User Create Data Metadata
#' @description In dev script to see about automating some of the metadata creationm using EML
#' @import EML
#'
#'

metadat.path <- "~./data/metadata"

auth <- list(individualName = list(givenName = "FirstName", surName = "LastName"))
my_eml <- list(dataset = list(
  title = "A Minimal Valid EML for Test Dataset",
  creator = auth,
  contact = auth)
)


write_eml(my_eml, "ex.xml")
#> NULL
eml_validate("ex.xml")


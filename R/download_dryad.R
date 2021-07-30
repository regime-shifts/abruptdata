## Function borrowed from Carl Boettiger's GitHub (gathered 2021-07-30)
## Source code:https://gist.github.com/cboettig/969706

download_dryad <- function(id, curl=getCurlHandle() ){
  # Returns the url to data file
  mets_metadata <- sprintf("%s/%s/%s", "http://datadryad.org/metadata/handle/", id, "/mets.xml")
  tt <- getURLContent(mets_metadata, curl=curl)
  page <- xmlParse(tt)
  out <- xpathApply(page, "//mets:FLocat",
                    function(x){
                      link <- xmlAttrs(x, "xlink:href")
                      bitstream <- link["xlink:href"]
                      sprintf("%s/%s", "http://datadryad.org", bitstream)
                    })
  out[[1]]
}

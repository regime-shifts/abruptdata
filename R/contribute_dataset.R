# This will be an interactive file for folx to run when contributing data.
# envisioning somethign like
# not sure if this will be an interactive file or an exported function?

# load data
# load attributes table
# use munge_dataset()
# check / tests
# open data.R and add documentation
# build and cmd check
fun <- function(){

  name <- readline("What is the name of the dataset? Please conform to: taxa_system_leadauth naming convention")
  loc.ind <- menu(c("Yes", "No"),
                   "Is the data available for download via a link?")


  t <- readline("What are the T values?")
  v <- readline("What are the V values?")

  x <- as.numeric(unlist(strsplit(x, ",")))
  y <- as.numeric(unlist(strsplit(y, ",")))
  t <- as.numeric(unlist(strsplit(t, ",")))
  v <- as.numeric(unlist(strsplit(v, ",")))

  out1 <- x + y
  out2 <- t + v

  return(list(out1, out2))

}

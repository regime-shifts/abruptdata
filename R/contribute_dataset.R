# # This will be an interactive file for folx to run when contributing data.
# # envisioning somethign like
# # not sure if this will be an interactive file or an exported function?
#
# # load data
# # load attributes table
# # use munge_dataset()
# # check / tests
# # open data.R and add documentation
# # build and cmd check
# fun <- function(){
#   new.dataset <- NULL
#   ## Gather basic characteristics about the data.
#   name <- readline("What is the name of the dataset? Please see README for naming convention.")
#
#   license.check <- menu(c("Yes", "No", "I'm not sure"),
#                         title = "Is this data published or available for use by the public? E.g., data has license CC0, MIT, etc.?")
#   loc.ind <- menu(c("Yes", "No"),
#                    "Is the data available for download via a public link?")
#   if(license.check==3 & loc.ind==2) {stop("We cannot include data that is not publicly aviable and/or does not specify 'open' use license. Please submit an issue if you have questions or concerns. https://github.com/regime-shifts/abruptdata/issues")}
#
#   ## write function to either grab from dryad, or another DB, or just direct, single file
#   if(loc.ind==1){
#     # If at Dryad, user should submit the location, DOI,
#     temp <- menu(c("",""),  "")
#
#   }
#   # if()
#
#   t <- readline("What are the T values?")
#   v <- readline("What are the V values?")
#
#   x <- as.numeric(unlist(strsplit(x, ",")))
#   y <- as.numeric(unlist(strsplit(y, ",")))
#   t <- as.numeric(unlist(strsplit(t, ",")))
#   v <- as.numeric(unlist(strsplit(v, ",")))
#
#   out1 <- x + y
#   out2 <- t + v
#
#   return(list(out1, out2))
#
# }

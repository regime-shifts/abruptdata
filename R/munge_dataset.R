#' @title Munge Datasets to Conform to Package Standards
#'
#' @description A function for munging each dataset accordin gto what is specified in teh attribues table
#'
#' @param data The dataset being created
#' @param attributes The attributes table describing the variables existing in *data*
#' @importFrom  rlang parse_expr()
#'

munge_dataset <- function(data, attributes) {
  # First, ensure all defined attributes exist in the data
  if (!all(unique(attributes$attributeName) %in% colnames(data))) {
    stop("Mismatch in column names among the attributes and data. ")
  }


  # vars of interest
  attrs <- c("driverAttribute", "responseAttribute", "treatmentAttribute", "blockingAttribute","siteAttribute","envgradientAttribute","temporalAttribute")

# gather the relevant column names for each variable type -----------------
for(i in seq_along(attrs)){
 if(exists("index") & i==1){rm(index)}
 if(!eval(expression(attrs[i])) %in% colnames(attributes))next(paste0("Skipping ", attrs[i], ": variable not found in attributes table"))

temp <- attributes %>%
  filter(!!rlang::parse_expr(attrs[i]) == TRUE) %>%
  distinct(attributeName)
if(nrow(temp)==0)next()

temp <- data.frame(attributeType = eval(expression(attrs[i])),
                             attributeName=temp$attributeName)

if(i==1){index <- temp}else(index <-bind_rows (df, temp))
rm(temp)

} # end loop for creating index dataframe

# Munge the dataset to have conforming variable names ---------------------
data <- merge(index, data)




} # end function

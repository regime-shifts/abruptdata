#' @title Munge Datasets to Conform to Package Standards
#'
#' @description A function for munging each dataset accordin gto what is specified in teh attribues table
#'
#' @param data The dataset being created
#' @param attributes The attributes table describing the variables existing in *data*
#' @importFrom  rlang parse_expr
#' @importFrom dplyr filter
#' @importFrom dplyr bind_rows
#'

munge_dataset <- function(data, attributes) {
  # First, ensure all defined attributes exist in the data
  if (!all(unique(attributes$attributeName) %in% colnames(data))) {
    stop("Mismatch in column names among the attributes and data. ")
  }


  # vars of interest
  attrs <- c("driverAttribute", "responseAttribute", "treatmentAttribute", "blockingAttribute","siteAttribute","envgradientAttribute","temporalAttribute")

# gather the relevant column names for each variable type -----------------
if(exists("index")){rm(index)}

for(i in seq_along(attrs)){
 if(!eval(expression(attrs[i])) %in% colnames(attributes))next(paste0("Skipping ", attrs[i], ": variable not found in attributes table"))

temp <- attributes %>%
  filter(!!rlang::parse_expr(attrs[i]) == TRUE) %>%
  distinct(attributeName)
if(nrow(temp)==0)next()

temp <- data.frame(attributeType = eval(expression(attrs[i])),
                             attributeName=temp$attributeName)

if(!exists("index")){index <- temp;}
if(exists("index"))(index <-dplyr::bind_rows(index, temp))
suppressWarnings(rm(temp))

} # end loop for creating index dataframe


# Create a list containing the attributes and the dataset -----------------
mylist <- list("dataset"=data, "attributes"=index)

return(mylist)

  } # end function

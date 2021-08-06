#' @title Munge Datasets to Conform to Package Standards
#'
#' @description A function for munging each dataset accordin gto what is specified in teh attribues table
#'
#' @param data The dataset being created
#' @param attributes The attributes table describing the variables existing in *data*
#' @param df.citation Default NULL. Ideally a string containing the citation for the dataset in use in the style of .bibtex.
#' @importFrom  rlang parse_expr
#' @importFrom dplyr filter
#' @importFrom dplyr bind_rows
#' @importFrom dplyr distinct
#'

munge_dataset <- function(data, attributes, df.citation=NULL) {
  # First, ensure all defined attributes exist in the data
  if (!all(unique(attributes$attributeName) %in% colnames(data))) {
    stop("Mismatch in column names among the `attributes` and `data` objects ")
  }

  # vars of interest
  attrs <- c("driverAttribute", "responseAttribute", "treatmentAttribute", "blockingAttribute","siteAttribute","envgradientAttribute","temporalAttribute")

# gather the relevant column names for each variable type -----------------
if(exists("index")){rm(index)}

for(i in seq_along(attrs)){
  if(i==1) index <- NULL
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
  data <- tibble::as_tibble(data) # Force data to tibble

# Add metadata and citation information as attributes to the tibble --------------------------------
# Grab the citation information
if(is.null(df.citation)){df.citation <-
  "No citation for this dataset was provided in `munge_dataset()`";
   message(df.citation);
}

  attr(data, "citation") <- df.citation
  attr(data, "metadata") <- tibble::tibble(index)

  # This function forces the attributes to print when the data frame is printed.
  # We might want to implement this for the  label $citation.
  # class(data) <- c("my_tbl", class(data))
  #      print.my_tbl <- function(x) {
  #         NextMethod(x)
  #        print(attr(x,"metadata"))
  #        print(attr(x,"citation"))
  #        invisible(x)
  #      }

return(data)

  } # end function

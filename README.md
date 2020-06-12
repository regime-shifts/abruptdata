# abruptdata
Data package comprising ecological datasets exhibiting abrupt change and relevant data suitable for evaluating methods for detecting abrupt change and ecological regime shifts. 
<!-- badges: start -->
![R lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)[![R build status](https://github.com/regime-shifts/abruptdata/workflows/R-CMD-check/badge.svg)](https://github.com/regime-shifts/abruptdata/actions)
<!-- badges: end -->


This package serves two purposes:
1. Provide standardized data for the R package [regime-shifts/abruptdata](github.com/regime-shifts/abruptdata)
2. Inform a database for applying or evaluating statistical methods for identifying ecological regime shifts or abrupt changes

We welcome data contributions, but please follow code of conduct.


## Installation
You can install the in-development version of abrupt from GitHub with:

``` r
remotes::install_github("regime-shifts/abruptdata")
```
## Contributing Data
Instructions go here-this is a draft but:
Step 1. Fork the repository  
Step 2. Add the data (see data-raw/add-data-template.R; edit this script and rename to reflect a short, intuitive version of the dataset you are adding, but please make sure it does not overlap with any other, existing data (see names of .rda files in  /data). Run the script. This will add the data to /data/  
Step 3.    
Step 4. Submit pull request   

## Code of Conduct

Please note that the abrupt project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.

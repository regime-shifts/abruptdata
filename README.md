# abruptdata
<!-- badges: start -->
![R lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)[![R build status](https://github.com/regime-shifts/abruptdata/workflows/R-CMD-check/badge.svg)](https://github.com/regime-shifts/abruptdata/actions)![pkgdown](https://github.com/regime-shifts/abruptdata/workflows/pkgdown/badge.svg?branch=main)
<!-- badges: end -->

`abruptdata` is an R package comprising ecological datasets exhibiting abrupt change. These data can or have been used to demonstrate ecological regime shifts or abrupt change in empirical and simulated systems, and may be suitable for evaluating quantitative methods for detecting such changes. 

This package serves two purposes:
1. Provide standardized data for the R package [regime-shifts/abruptdata](github.com/regime-shifts/abruptdata)
2. Inform a database for applying or evaluating statistical methods for identifying ecological regime shifts or abrupt changes

## Installation
Install the in-development version of `abruptdata` from GitHub by calling:
``` r
remotes::install_github("regime-shifts/abruptdata")
```

## Contributing Data

1. Fork the repository  
2. Add the original data to /data-raw/
3. Identify a short, intuitive name {{dataset}} for your contributed dataset. For example dataset names and to ensure {{dataset}} does not conflict with existing data, see [our list of datasets here](https://regime-shifts.github.io/abruptdata/reference/index.html).  
  - Copy the file or contents within the file ./data-raw/add-data-template.R into a new file, /data-raw/{{dataset}}.R
4. Add metadata describing the new dataset to /R/data.R/. Directly edit the /R/data.R with new fields to describe {{dataset}}. Follow the conventions used in other datasets, and provide as much detail as possible
5. Submit pull request to reigme-shifts/abruptdata/MAIN and wait for approval or feedback.   

## Code of Conduct
Please note that the abrupt project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.

## Disclaimers
*These data are preliminary or provisional and are subject to revision. They are being provided to meet the need for timely best science. The data have not received final approval by the U.S. Geological Survey (USGS) and are provided on the condition that neither the USGS nor the U.S. Government shall be held liable for any damages resulting from the authorized or unauthorized use of the data.
This information is preliminary or provisional and is subject to revision. It is being provided to meet the need for timely best science. The information has not received final approval by the U.S. Geological Survey (USGS) and is provided on the condition that neither the USGS nor the U.S. Government shall be held liable for any damages resulting from the authorized or unauthorized use of the information.
This software is preliminary or provisional and is subject to revision. It is being provided to meet the need for timely best science. The software has not received final approval by the U.S. Geological Survey (USGS). No warranty, expressed or implied, is made by the USGS or the U.S. Government as to the functionality of the software and related material nor shall the fact of release constitute any such warranty. The software is provided on the condition that neither the USGS nor the U.S. Government shall be held liable for any damages resulting from the authorized or unauthorized use of the software.*

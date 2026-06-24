#' Extract an identifier using regex
#'
#' This is an internal helper function for exported functions such as
#' extract_labno, extract_worksheet and extract_suffix to reduce code
#' duplication when checking inputs and outputs.
#'
#' @param input The string to search
#' @param pattern The regular expression to match
#' @param group The group within the regular expression
#'
#' @returns The matching identifier from the string
extract_id <- function(input, pattern, group) {

  if (!is.character(input)) stop("input must be a string")

  if (input == "") stop("input must not be empty")

  output <- stringr::str_extract(string = input,
                                           pattern = pattern,
                                           group = group)

  if (is.na(output)) warning("NA value returned")

  return(output)

}



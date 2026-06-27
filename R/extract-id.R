#' Extract an identifier using regex
#'
#' @description
#' `extract_id` is a generic function for extracting a pattern from strings,
#' with input and output checks.
#' It is used as the basis for specific `extract_*` functions such as
#' `extract_labno` and `extract_worksheet` to reduce code
#' duplication.
#'
#' @param input The string to search
#' @param pattern The regular expression to match
#' @param group The group within the regular expression
#'
#' @returns The matching identifier from the string
#' @export
#'
#' @examples
#'
#' # Example to find labno
#' file_string <- "WS123456_12345678_sequencing_results.xlsx"
#'
#' extract_id(file_string,
#'            pattern = regex_ids()$labno_suffix$regex,
#'            group = regex_ids()$labno_suffix$labno_group)
#'
#' # Errors when empty string supplied
#' try(extract_id("",
#'              pattern = regex_ids()$labno_suffix$regex,
#'              group = regex_ids()$labno_suffix$labno_group))
#'
extract_id <- function(input, pattern, group) {

  if (!is.character(input)) stop("input must be a string")

  if (input == "") stop("input must not be empty")

  output <- stringr::str_extract(string = input,
                                           pattern = pattern,
                                           group = group)

  if (is.na(output)) warning("NA value returned")

  return(output)

}



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

  # Check input
  if (any(!is.character(input))) stop("input must be a string")

  if (any(is.na(input))) stop("input must not contain NA values")

  if (any(trimws(input) == "")) stop("input must not be empty or contain only whitespace")

  # Check pattern
  if (missing(pattern) || is.null(pattern)) stop("pattern must be supplied")

  if (!is.character(pattern) && !inherits(pattern, "stringr_pattern")) {
    stop("pattern must be a character string or stringr::regex() object")
  }

  # Check group
  if (missing(group) || !is.numeric(group)) {
    stop("group must be a number")
  }

  output <- stringr::str_extract(string = input,
                                           pattern = pattern,
                                           group = group)

  return(output)

}



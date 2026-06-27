#' Extract a sample replicate suffix from a string
#'
#' @description
#' `extract_suffix` extracts the letter suffix from after a DNA lab number.
#' Letter suffixes are used when samples are tested in multiple replicates
#' (Examples: 12345678a, 12345678b, 12345678c).
#' More detail is provided in the documentation for `regex_ids`.
#'
#' @param input A character string containing a lab number and a suffix
#'
#' @returns A character string of the suffix. Inputs without a suffix with
#' return "".
#' @export
#'
#' @examples
#' # Example with suffix
#' extract_suffix("WS123456_12345678a_replicate1")
#'
#' # Empty string returned when no suffix is present
#' extract_suffix("WS123456_12345678_replicate1")
#'
extract_suffix <- function(input){

  extract_id(input = input,
             pattern = regex_ids()$labno_suffix$regex,
             group = regex_ids()$labno_suffix$suffix_group)

}

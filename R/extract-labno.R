#' Extract lab number from a string
#'
#' @description
#' `extract_labno` extracts the DNA lab number (labno) from an input string,
#' using `extract_id` and `regex_ids`. A full description of the format of
#' the labno identifier is included in the documentation for `regex_ids`.
#'
#' @param input A character string containing a lab number
#'
#' @returns The lab number as a string
#' @export
#'
#' @examples
#' extract_labno("WS123456_12345678")
#'
extract_labno <- function(input){

  extract_id(input = input,
             pattern = regex_ids()$labno_suffix$regex,
             group = regex_ids()$labno_suffix$labno_group)

}

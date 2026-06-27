#' Extract worksheet from a character string
#'
#' @description
#' `extract_worksheet` extracts the worksheet identifier from an input string,
#' relying on `extract_id` and `regex_ids`.
#' Details of the worksheet number format are given in the documentation for
#' `regex_ids`.
#'
#' @param input A character string containing a worksheet identifier
#'
#' @returns The worksheet identifier as a string
#' @export
#'
#' @examples
#' extract_worksheet("WS123456_12345678")
#'
extract_worksheet <- function(input){

  extract_id(input = input,
             pattern = regex_ids()$worksheet$regex,
             group = regex_ids()$worksheet$worksheet_group)

}

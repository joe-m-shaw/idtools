#' Extract combined plate number from a character string
#'
#' @description
#' `extract_combined_plate` extracts the combined plate number from an input
#' string, using `extract_id` and `regex_ids`. A full description of the
#' format of the combined plate identifier is included in the documentation
#' for `regex_ids`.
#'
#' @param input A character string containing a combined plate number
#'
#' @returns The combined plate number as a string
#' @export
#'
#' @examples
#' extract_combined_plate("WS123456_CP12345_results.csv")
#'
extract_combined_plate <- function(input) {

  extract_id(input = input,
             pattern = regex_ids()$combined_plate$regex,
             group = regex_ids()$combined_plate$combined_plate_group)

}

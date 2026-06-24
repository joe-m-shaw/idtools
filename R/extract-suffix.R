#' Extract a sample replicate suffix from a string
#'
#' When multiple replicates of a DNA lab number (labno) are tested on the same
#' worksheet, a letter is added directly after each labno.
#'
#' Example: 12345678a, 12345678b, 12345678c
#'
#' @param input A character string containing a lab number and a suffix
#'
#' @returns A character string of the suffix. Inputs without a suffix with
#' return "".
#' @export
#'
#' @examples extract_suffix("WS123456_12345678a_replicate1")
extract_suffix <- function(input){

  extract_id(input = input,
             pattern = regex_ids()$labno_suffix$regex,
             group = regex_ids()$labno_suffix$suffix_group)

}

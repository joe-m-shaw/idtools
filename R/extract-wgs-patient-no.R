#' Extract WGS patient number from a character string
#'
#' @description
#' `extract_wgs_patient_no` extracts the whole genome sequencing (WGS)
#' patient number from an input string, using `extract_id` and `regex_ids`.
#' A description of the format of the WGS patient number is included in the
#' documentation for `regex_ids`.
#'
#' @param input A character string containing a WGS patient number
#'
#' @returns The WGS patient number as a string
#' @export
#'
#' @examples
#' extract_wgs_patient_no("1234567890_p12345678901_LP1234567-DNA-reported_variants.csv")
#'
extract_wgs_patient_no <- function(input){

  extract_id(input,
             pattern = regex_ids()$wgs_patient_no$regex,
             group = regex_ids()$wgs_patient_no$wgs_patient_no_group)

}

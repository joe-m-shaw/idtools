#' Extract WGS referral number from a character string
#'
#' @description
#' `extract_wgs_referral_no` extracts the whole genome sequencing (WGS)
#' referral number from an input string, using `extract_id` and `regex_ids`.
#' A description of the format of the WGS referral number is included in the
#' documentation for `regex_ids`.
#'
#' @param input A character string containing a WGS referral number
#'
#' @returns The WGS referral number as a string
#' @export
#'
#' @examples
#' extract_wgs_referral_no("Referral ID: r12345678901")
#'
extract_wgs_referral_no <- function(input){

  extract_id(input,
             pattern = regex_ids()$wgs_referral_no$regex,
             group = regex_ids()$wgs_referral_no$wgs_referral_no_group)

}

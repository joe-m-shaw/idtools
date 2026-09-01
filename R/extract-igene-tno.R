#' Extract iGene T number from a character string
#'
#' @description
#' `extract_igene_tno` extracts the iGene test number from a string,
#' using `extract_ids`. A description of the format of iGene referral numbers
#' is included in the documentation for `regex_ids`.
#'
#' @param input A character string containing an iGene T number
#'
#' @returns The iGene T number as a string
#' @export
#'
#' @examples
#' extract_igene_tno("MPL-00001_D26-AB12_ctDNA_M1_T26-AB12")
#'
extract_igene_tno <- function(input){

  extract_id(input = input,
             pattern = regex_ids()$igene_tno$regex,
             group = regex_ids()$igene_tno$igene_tno_group)
}

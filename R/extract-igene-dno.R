#' Extract iGene D number from a character string
#'
#' @description
#' `extract_igene_dno` extracts the iGene derivative number from a string,
#' using `extract_ids`. A description of the format of iGene referral numbers
#' is included in the documentation for `regex_ids`.
#'
#' @param input A character string containing an iGene D number
#'
#' @returns The iGene D number as a string
#' @export
#'
#' @examples
#' extract_igene_dno("MPL-00001_D26-AB12_ctDNA_M1_T26-AB12")
#'
extract_igene_dno <- function(input){

  extract_id(input = input,
             pattern = regex_ids()$igene_dno$regex,
             group = regex_ids()$igene_dno$igene_dno_group)
}

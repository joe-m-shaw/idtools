#' Extract iGene R number from a character string
#'
#' @description
#' `extract_igene_rno` extracts the iGene referral number from a string,
#' using `extract_ids`. A description of the format of iGene referral numbers
#' is included in the documentation for `regex_ids`.
#'
#' @param input A character string containing an iGene R number
#'
#' @returns The iGene R number as a string
#' @export
#'
#' @examples
#' extract_igene_rno("WS123456_R26-12AB")
#'
extract_igene_rno <- function(input){

  extract_id(input = input,
             pattern = regex_ids()$igene_rno$regex,
             group = regex_ids()$igene_rno$igene_rno_group)
}

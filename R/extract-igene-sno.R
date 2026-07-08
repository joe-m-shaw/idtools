#' Extract iGene S number from a character string
#'
#' @description
#' `extract_igene_sno` extracts the iGene sample number from a string, using
#' `extract_id` and `regex_ids`. A description of the format of iGene sample
#' numbers is included in the documentation for `regex_ids`.
#'
#' @param input A character string containing an iGene S number
#'
#' @returns The iGene S number as a string
#' @export
#'
#' @examples
#' extract_igene_sno("WS123456_S26-12AB")
#'
extract_igene_sno <- function(input){

  extract_id(input,
             pattern = regex_ids()$igene_sno$regex,
             group = regex_ids()$igene_sno$igene_sno_group)

}

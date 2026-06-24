#' Extract iGene R number from a character string
#'
#' The iGene database uses R numbers to identify individual referrals.
#'
#' The R number is R, followed by the year as 2 digits (2026 = 26) and then
#' a random string of 5 alphanumeric characters.
#'
#' @param input A character string containing an iGene R number
#'
#' @returns The iGene R number as a string
#' @export
#'
#' @examples extract_igene_rno("WS123456_R26-12AB")
extract_igene_rno <- function(input){

  extract_id(input = input,
             pattern = regex_ids()$igene_rno$regex,
             group = regex_ids()$igene_rno$igene_rno_group)
}

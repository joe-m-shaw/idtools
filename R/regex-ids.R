#' Regular expressions for sample identifiers
#'
#' This function is a centralised place for regular expressions for extracting
#' different identitiers.
#' Regular expressions are written as raw strings using `stringr::regex` which
#' makes them easier to understand and maintain.
#' The ["Regular Expressions" chapter in "R for Data Science"](https://r4ds.hadley.nz/regexps.html)
#' is a great resource for understanding regular expressions.
#'
#' @returns A named list of regular expressions for different identifiers
#' @export
#'
#' @examples regex_ids()$labno_suffix
regex_ids <- function(){

  output_list <- list(

    # Worksheet
    "worksheet" = list(
      "regex" = stringr::regex(
        r"[
        (^|\D+)              # Start of string or any character
        (WS\d{6}|ws\d{6})   # WS or ws followed by 6 digits
        (\D+|$)             # Must be followed by non-digit characters or end of string
        ]",
        comments = TRUE),
      "worksheet_group" = 2),

    # Lab number and suffix
    "labno_suffix" = list(
      "regex" = stringr::regex(
        r"[
        (^|\D+)       # Either the start of string or non-digit characters (to
                      # prevent pulling out 8 digits from longer digit strings)
        (\d{8})       # Lab number: 8 digits
        ([a-z]{1}|)   # Suffix: either lowercase letter or empty
        (\D+|$)       # Either a non-digit character or end of the string
        ]",
        comments = TRUE),
      "labno_group" = 2,
      "suffix_group" = 3),

    # iGene R number
    "igene_rno" = list(
      "regex" = stringr::regex(
        r"[
        (
        R\d{2}-           # R with 2 digits: R24, R25 etc
        [[:alnum:]]{4}    # 4 alphanumeric characters
        )
        ]",
        comments = TRUE
      ),
      "igene_rno_group" = 1
    )
  )

  return(output_list)

}

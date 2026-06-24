#' Regular expressions for sample identifiers
#'
#' Labno is specified as having non-digits on either side, to prevent
#' extracting 8 digits from a longer string of digits.
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
        (a|b|c|d|)    # Suffix: either a-d or empty
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

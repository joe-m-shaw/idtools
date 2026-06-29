#' Add sample identifiers from a filename as new columns
#'
#' @description
#' `mutate_ids` extracts the three most common sample identifiers (worksheet,
#' labno and suffix) from a column
#' within a dataframe, and adds them as separate columns with
#' `dplyr::mutate`.
#' Details on the formats of each identifier are included in the documentation
#' for `regex_ids`.
#'
#' `mutate_ids` adds extra columns for labno, suffix and worksheet, and then
#' also concatenates the identifiers together as labno_suffix and
#' labno_suffix_worksheet. This is intended to given ultimate flexibility
#' when filtering or grouping data from multiple experiments.
#'
#' This function is particularly effective when combined with the pipe (|>)
#' operator as it takes a dataframe as its input.
#' Extra detail of using `mutate_ids` is provided in the vignette.
#'
#' @param df The dataframe to add identifiers to
#' @param id_col The column in the dataframe which includes the filename.
#'
#' @importFrom rlang .data
#'
#' @returns The original dataframe with additional columns of identifiers
#' from the filename column
#' @export
#'
#' @examples
#'
#' # Dataframe of results from multiple files with filename as a column
#' results_df <- tibble::tribble(
#' ~result, ~filename,
#' "Variant detected", "WS123456_12345678a_PierreBEZUKHOV.xlsx",
#' "Variant not detected", "WS123456_23456789_AnnaKARENINA.xlsx",
#' "Variant not detected", "WS123456_34567890_IvanILYICH.xlsx")
#'
#' # Use `mutate_ids` to separate identifiers
#' results_df |>
#'   mutate_ids(filename)
#'
mutate_ids <- function(df,
                       id_col){

  if(!is.data.frame(df)){
    stop("input must be a dataframe")
  }

  if("labno" %in%
     colnames(df)){
    message("Input already contains a column called labno. This will be replaced by the output of extract_labno.")
  }

  if("suffix" %in%
     colnames(df)){
    message("Input already contains a column called suffix. This will be replaced by the output of extract_suffix.")
  }

  if("worksheet" %in%
     colnames(df)){
    message("Input already contains a column called worksheet. This will be replaced by the output of extract_worksheet.")
  }

  output <- df |>
    dplyr::rowwise() |>
    dplyr::mutate(
      labno = {
        value <- extract_labno({{ id_col }})
        if(is.na(value)) message("NA returned for labno at ",
                                 {{ id_col }})
        value
      },
      suffix = {
        value <- extract_suffix({{ id_col }})
        if(is.na(value)) message("NA returned for suffix at ",
                                 {{ id_col }})
        value
      },
      worksheet = {
        value <- extract_worksheet({{ id_col }})
        if(is.na(value)) message("NA returned for worksheet at ",
                                 {{ id_col }})
        value
      },
      labno_suffix = paste0(.data$labno, .data$suffix),
      labno_suffix_worksheet = paste0(.data$labno_suffix,
                                      "_",
                                      .data$worksheet),
      .after = {{ id_col }}) |>
    dplyr::ungroup()

  return(output)

}

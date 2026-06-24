#' Add sample identifiers from filename as additional data columns
#'
#' This function extracts the 3 common identifiers (worksheet, labno and
#' suffix) which are included in filenames.
#'
#' Patient name and NGS panel are both not included in `mutate_ids`, as they
#' are not always present in filenames.
#'
#' @param df The dataframe to add identifiers to
#' @param id_col The column in the dataframe which includes the filename
#'
#' @returns The original dataframe with additional columns of identifiers
#' from the filename column
#' @export
mutate_ids <- function(df,
                       id_col = filename){

  if(!is.data.frame(df)){
    stop("input must be a dataframe")
  }

  output <- df |>
    dplyr::rowwise() |>
    dplyr::mutate(
      labno = extract_labno({{ id_col }}),
      suffix = extract_suffix({{ id_col }}),
      worksheet = extract_worksheet({{ id_col }}),
      labno_suffix = paste0(labno, suffix),
      labno_suffix_worksheet = paste0(labno_suffix, "_", worksheet)) |>
    dplyr::ungroup()

  if(anyNA.data.frame(output)){
    warning("output contains NA values")
  }

  return(output)

}

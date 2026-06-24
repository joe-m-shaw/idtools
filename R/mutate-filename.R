#' Add filename and filepath to a dataframe
#'
#' This function is a helper function to reduce code duplication for
#' the read_.*_with_filename series of functions.
#'
#' @param df A dataframe
#' @param filepath The filepath of the file the dataframe has been read from
#'
#' @returns The dataframe with filepath and filename columns
#' @export
#'
mutate_filename <- function(df, filepath) {

  output <- df |>
    janitor::clean_names() |>
    dplyr::mutate(filepath = filepath,
                  filename = basename(filepath))

  return(output)

}

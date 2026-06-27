read_with_filename <- function(filepath, read_fn, use_janitor = TRUE, ...) {

  output <- read_fn(filepath, ...) |>
    dplyr::mutate(filepath = filepath,
                  filename = basename(filepath))

  if(use_janitor == TRUE) {

    output <- output |>
      janitor::clean_names()

  }

  return(output)

}

extract_combined_plate <- function(input) {

  extract_id(input = input,
             pattern = regex_ids()$combined_plate$regex,
             group = regex_ids()$combined_plate$combined_plate_group)

}

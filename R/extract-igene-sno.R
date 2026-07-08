extract_igene_sno <- function(input){

  extract_id(input,
             pattern = regex_ids()$igene_sno$regex,
             group = regex_ids()$igene_sno$igene_sno_group)

}

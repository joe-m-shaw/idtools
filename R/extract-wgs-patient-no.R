extract_wgs_patient_no <- function(input){

  extract_id(input,
             pattern = regex_ids()$wgs_patient_no$regex,
             group = regex_ids()$wgs_patient_no$wgs_patient_no_group)

}

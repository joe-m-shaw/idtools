extract_wgs_referral_no <- function(input){

  extract_id(input,
             pattern = regex_ids()$wgs_referral_no$regex,
             group = regex_ids()$wgs_referral_no$wgs_referral_no_group)

}

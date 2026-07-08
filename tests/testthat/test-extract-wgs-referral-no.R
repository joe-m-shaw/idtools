test_that("extract_wgs_referral_no works", {

  expect_equal(extract_wgs_referral_no("Referral ID: r12345678901"),
               "r12345678901")

})

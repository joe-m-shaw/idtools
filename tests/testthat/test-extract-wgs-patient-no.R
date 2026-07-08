test_that("extract_wgs_patient_no works", {

  expect_equal(extract_wgs_patient_no("1234567890_p12345678901_LP1234567-DNA-reported_variants.csv"),
                                      "p12345678901")

})

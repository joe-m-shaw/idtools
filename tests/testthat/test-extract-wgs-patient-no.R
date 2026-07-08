test_that("extract_wgs_patient_no works", {

  expect_equal(extract_wgs_patient_no("1234567890_p12345678901_LP1234567-DNA-reported_variants.csv"),
                                      "p12345678901")

})

test_that("non-character input stops with an error", {
  expect_error(extract_wgs_patient_no(12345678901), "input must be a string")
})

test_that("empty string stops with an error", {
  expect_error(extract_wgs_patient_no(""), "input must not be empty")
})

test_that("returns NA when no patient number is present", {
  expect_true(is.na(extract_wgs_patient_no("LP1234567-DNA-reported_variants.csv")))
})

test_that("uppercase P returns NA", {
  expect_true(is.na(extract_wgs_patient_no("sample_P12345678901_end")))
})

test_that("fewer than 11 digits returns NA", {
  expect_true(is.na(extract_wgs_patient_no("sample_p1234567890_end")))
})

test_that("more than 11 digits returns NA", {
  expect_true(is.na(extract_wgs_patient_no("sample_p123456789012_end")))
})

test_that("patient number without additional text is handled", {
  expect_equal(extract_wgs_patient_no("p12345678901"), "p12345678901")
})

test_that("a referral number in the input does not match as a patient number", {
  expect_true(is.na(extract_wgs_patient_no("Referral: r12345678901")))
})

test_that("first patient number is extracted when two are present", {
  expect_equal(extract_wgs_patient_no("p11111111111_p22222222222"),
               "p11111111111")
})

test_that("vectorised input is handled", {
  expect_equal(extract_wgs_patient_no(c("Results_p12345678901.csv",
                                        "Results_p23456789012.csv",
                                        "Results_p34567890123.csv",
                                        "Results_no_patient_no.csv")),
               c("p12345678901", "p23456789012", "p34567890123", NA))
})

test_that("filepath input is handled", {
  expect_equal(extract_wgs_patient_no("drive:/folder1/folder2/p12345678901/results/"),
               "p12345678901")
})

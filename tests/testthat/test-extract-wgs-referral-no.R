test_that("extract_wgs_referral_no works", {

  expect_equal(extract_wgs_referral_no("Referral ID: r12345678901"),
               "r12345678901")

})

test_that("non-character input stops with an error", {
  expect_error(extract_wgs_referral_no(12345678901), "input must be a string")
})

test_that("empty string stops with an error", {
  expect_error(extract_wgs_referral_no(""), "input must not be empty")
})

test_that("returns NA when no referral number is present", {
  expect_true(is.na(extract_wgs_referral_no("LP1234567-DNA-reported_variants.csv")))
})

test_that("uppercase R returns NA", {
  expect_true(is.na(extract_wgs_referral_no("sample_R12345678901_end")))
})

test_that("fewer than 11 digits returns NA", {
  expect_true(is.na(extract_wgs_referral_no("sample_r1234567890_end")))
})

test_that("more than 11 digits returns NA", {
  expect_true(is.na(extract_wgs_referral_no("sample_r123456789012_end")))
})

test_that("referral number without additional text is handled", {
  expect_equal(extract_wgs_referral_no("r12345678901"), "r12345678901")
})

test_that("a patient number in the input does not match as a referral number", {
  expect_true(is.na(extract_wgs_referral_no("Patient: p12345678901")))
})

test_that("first referral number is extracted when two are present", {
  expect_equal(extract_wgs_referral_no("r11111111111_r22222222222"),
               "r11111111111")
})

test_that("vectorised input is handled", {
  expect_equal(extract_wgs_referral_no(c("Results_r12345678901.csv",
                                         "Results_r23456789012.csv",
                                         "Results_r34567890123.csv",
                                         "Results_no_referral_no.csv")),
               c("r12345678901", "r23456789012", "r34567890123", NA))
})

test_that("filepath input is handled", {
  expect_equal(extract_wgs_referral_no("drive:/folder1/folder2/r12345678901/results/"),
               "r12345678901")
})

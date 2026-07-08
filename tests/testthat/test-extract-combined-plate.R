test_that("extract_combined_plate works", {

  expect_equal(extract_combined_plate("WS123456_CP12345_results.csv"),
               "CP12345")

})

test_that("non-character input stops with an error", {
  expect_error(extract_combined_plate(12345), "input must be a string")
})

test_that("empty string stops with an error", {
  expect_error(extract_combined_plate(""), "input must not be empty")
})

test_that("returns NA when no combined plate number is present", {
  expect_true(is.na(extract_combined_plate("WS123456_12345678_results.csv")))
})

test_that("lowercase cp returns correct result", {
  expect_equal(extract_combined_plate("WS123456_cp12345_results.csv"),
               "cp12345")
})

test_that("fewer than 5 digits returns NA", {
  expect_true(is.na(extract_combined_plate("WS123456_CP1234_results.csv")))
})

test_that("more than 5 digits returns NA", {
  expect_true(is.na(extract_combined_plate("WS123456_CP123456_results.csv")))
})

test_that("combined plate number without additional text is handled", {
  expect_equal(extract_combined_plate("CP12345"), "CP12345")
})

test_that("first combined plate number is extracted when two are present", {
  expect_equal(extract_combined_plate("CP12345_WS123456_CP23456"),
               "CP12345")
})

test_that("vectorised input is handled", {
  expect_equal(extract_combined_plate(c("Results_CP12345.csv",
                                        "Results_CP23456.csv",
                                        "Results_CP34567.csv",
                                        "Results_no_cp_here.csv")),
               c("CP12345", "CP23456", "CP34567", NA))
})

test_that("filepath input is handled", {
  expect_equal(extract_combined_plate("drive:/folder1/folder2/CP12345/results/"),
               "CP12345")
})

test_that("extract_worksheet works", {
  expect_equal(extract_worksheet("WS123456_12345678"),
               "WS123456")
})

test_that("extract_worksheet handles lowercase ws", {
  expect_equal(extract_worksheet("ws123456_12345678"),
               "ws123456")
})

test_that("error is thrown if more than 6 digits in worksheet number", {

  expect_true(is.na(extract_worksheet("WS12345678_12345678")))

})

test_that("worksheet without additional text is handled", {

  expect_equal(extract_worksheet("WS123456"),
               "WS123456")

})

test_that("omission of WS returns NA", {

  expect_true(is.na(extract_worksheet("Result_123456_12345678_file.csv")))

})

test_that("inclusion of hyphen returns NA", {

  expect_true(is.na(extract_worksheet("Result_WS-123456_12345678_file.csv")))

})

test_that("non-character input stops with an error", {
  expect_error(extract_worksheet(123456), "input must be a string")
})

test_that("empty string stops with an error", {
  expect_error(extract_worksheet(""), "input must not be empty")
})

test_that("fewer than 6 digits in worksheet number returns NA", {
  expect_true(is.na(extract_worksheet("WS12345_12345678")))
})

test_that("mixed case Ws returns NA", {
  expect_true(is.na(extract_worksheet("Ws123456_12345678")))
})

test_that("worksheet is extracted when embedded in text without separators", {
  expect_equal(extract_worksheet("ResultsWS123456file"), "WS123456")
})

test_that("worksheet is extracted when immediately followed by a letter", {
  expect_equal(extract_worksheet("WS123456a_12345678"), "WS123456")
})

test_that("first worksheet is extracted when two are present", {
  expect_equal(extract_worksheet("WS123456_12345678_WS234567_23456789"),
               "WS123456")
})

test_that("long filepaths are handled, and first worksheet is selected", {

  # Edge case: a folder name contains a different worksheet to the filename
  test_filepath <- "folder/path/WS123456/results/WS234567_12345678.csv"

  expect_equal(extract_worksheet(test_filepath), "WS123456")
  expect_equal(extract_worksheet(basename(test_filepath)), "WS234567")

})

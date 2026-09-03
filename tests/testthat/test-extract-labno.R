test_that("extract_labno works", {
  expect_equal(extract_labno("WS123456_12345678"),
               "12345678")
})

test_that("suffix letter is not included in the extracted lab number", {
  expect_equal(extract_labno("WS123456_12345678a"), "12345678")
})

test_that("correct 8-digit labno is selected instead of longer number", {
  expect_equal(extract_labno("Test_1111111111_WS123456_12345678_result"),
               "12345678")
})

test_that("labno is extracted when no spaces are included", {
  expect_equal(extract_labno("sample12345678test"),
               "12345678")
})

test_that("8 digits embedded inside a longer digit string are not extracted", {
  expect_true(is.na(extract_labno("WS123456_1234567890")))
})

test_that("lab number is extracted when it appears at the start of the string", {
  expect_equal(extract_labno("12345678_WS123456"), "12345678")
})

test_that("non-character input stops with an error", {
  expect_error(extract_labno(12345678), "input must be a string")
})

test_that("empty string stops with an error", {
  expect_error(extract_labno(""), "input must not be empty")
})

test_that("returns NA when no lab number is present", {
  expect_true(is.na(extract_labno("WS123456_no_labno_here")))
})

test_that("the first lab number is extracted if two are present", {
  expect_equal(extract_labno("12345678_WS123456_23456789"),
               "12345678")
})

test_that("long folderpaths are handled, and first labno is selected", {

  # Edge case where a folder name includes a different labno to the
  # results file
  test_filepath <- "folder/path/WS123456/results_for_12345678/WS234567_23456789.csv"

  expect_equal(extract_labno(test_filepath), "12345678")

  expect_equal(extract_labno(basename(test_filepath)), "23456789")

})

test_that("old 6-digit version of labno from pre-2012 will not be extracted", {

  expect_true(is.na(extract_labno("WS123456_123456")))

})

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
  expect_warning(
    result <- extract_labno("WS123456_1234567890"),
    "NA value returned"
  )
  expect_true(is.na(result))
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

test_that("returns NA with a warning when no lab number is present", {
  expect_warning(
    result <- extract_labno("WS123456_no_labno_here"),
    "NA value returned"
  )
})

test_that("the first lab number is extracted if two are present", {

  expect_equal(extract_labno("12345678_WS123456_23456789"),
               "12345678")

})

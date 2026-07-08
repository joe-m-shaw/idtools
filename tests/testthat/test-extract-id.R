test_that("extract_id works with character pattern input", {

  expect_equal(extract_id(input = "WS123456_12345678",
                          pattern = "(\\d{8})",
                          group = 1),
               "12345678")

})

test_that("extract_id works with regex pattern input", {

  expect_equal(extract_id(input = "WS123456_12345678",
                          pattern = regex_ids()$labno_suffix$regex,
                          group = regex_ids()$labno_suffix$labno_group),
               "12345678")

})

test_that("error is thrown with numeric input", {
  expect_error(extract_id(input = 123456,
                          pattern = "(12)",
                          group = 1),
               regexp = "input must be a string")
})

test_that("error is thrown with NA input", {

  expect_error(extract_id(input = NA,
                          pattern = regex_ids()$igene_rno$regex,
                          group = regex_ids()$igene_rno$igene_rno_group),
               regexp = "input must be a string")

})

test_that("error is thrown with empty string", {

  expect_error(extract_id(input = "",
                          pattern = regex_ids()$igene_rno$regex,
                          group = regex_ids()$igene_rno$igene_rno_group),
               regexp = "input must not be empty or contain only whitespace")

  expect_error(extract_id(input = "  ",
                          pattern = regex_ids()$igene_rno$regex,
                          group = regex_ids()$igene_rno$igene_rno_group),
               regexp = "input must not be empty or contain only whitespace")

})

test_that("error is thrown with dataframe input", {

  test_df <- data.frame(
    "labno" = c("12345678")
  )

  expect_error(extract_id(test_df,
             regex_ids()$labno_suffix$regex,
             regex_ids()$labno_suffix$labno_group),
             regexp = "input must be a string")

})

test_that("error is thrown if pattern not supplied", {

  expect_error(extract_id(input = "WS123456_12345678",
                          group = 1),
               regexp = "pattern must be supplied")

  expect_error(extract_id(input = "WS123456_12345678",
                          pattern = NULL,
                          group = 1),
               regexp = "pattern must be supplied")

})

test_that("errors are thrown if group is missing or not number", {

  expect_error(extract_id(input = "WS123456_12345678",
                          pattern = "(\\d{8})",
                          group = "1"),
               regexp = "group must be a number")

  expect_error(extract_id(input = "WS123456_12345678",
                          pattern = "(\\d{8})"),
               regexp = "group must be a number")

  expect_error(extract_id(input = "WS123456_12345678",
                          pattern = "(\\d{8})",
                          group = NULL),
               regexp = "group must be a number")

})

test_that("error is thrown if pattern supplied in wrong format", {

  expect_error(extract_id(input = "WS123456_12345678",
                          pattern = as.Date("2026-01-01"),
                          group = 1),
               regexp = "pattern must be a character string or stringr::regex\\(\\) object")

})


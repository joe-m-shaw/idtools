test_that("error is thrown with numeric input", {
  expect_error(extract_id(input = 123456,
                          pattern = "(12)",
                          group = 1))
})

test_that("error is thrown with NA input", {

  expect_error(extract_id(input = NA,
                          pattern = regex_ids()$igene_rno$regex,
                          group = regex_ids()$igene_rno$igene_rno_group))

})

test_that("error is thrown with empty string", {

  expect_error(extract_id(input = "",
                          pattern = regex_ids()$igene_rno$regex,
                          group = regex_ids()$igene_rno$igene_rno_group))

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



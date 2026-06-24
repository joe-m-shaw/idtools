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


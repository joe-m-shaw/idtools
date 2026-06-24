test_that("extract_labno works", {
  expect_equal(extract_labno("WS123456_12345678"),
               "12345678")
})

test_that("correct 8-digit labno is selected instead of longer number", {

  expect_equal(extract_labno("Test_1111111111_WS123456_12345678_result"),
               "12345678")

})

test_that("labno is extracted when no spaces are included", {
  expect_equal(extract_labno("sample12345678test"),
               "12345678")
})

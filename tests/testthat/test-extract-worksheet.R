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

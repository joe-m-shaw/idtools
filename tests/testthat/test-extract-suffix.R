test_that("extract_suffix works", {
  expect_equal(extract_suffix("WS123456_12345678a"),
               "a")
})

test_that("extract_suffix works without suffix", {

  expect_equal(extract_suffix("WS123456_12345678_PierreBEZUKHOV"),
               "")

})

test_that("labno at the end of the string is handled as empty suffix", {

  expect_equal(extract_suffix("WS123456_12345678"),
               "")

})

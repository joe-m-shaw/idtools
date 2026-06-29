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

test_that("different letters are handled as suffixes", {

  expect_equal(extract_suffix("WS123456_12345678b"),
               "b")

  expect_equal(extract_suffix("WS123456_12345678f"),
               "f")

  expect_equal(extract_suffix("WS123456_12345678z"),
               "z")

})

test_that("NA returned if labno not present",{

  expect_true(is.na(extract_suffix("WS123456_a_PierreBEZUKHOV")))

})


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

test_that("non-character input stops with an error", {
  expect_error(extract_suffix(12345678), "input must be a string")
})

test_that("empty string stops with an error", {
  expect_error(extract_suffix(""), "input must not be empty")
})

test_that("uppercase letter after labno is not treated as a suffix", {
  expect_equal(extract_suffix("WS123456_12345678A"), "")
})

test_that("only the first letter is returned when multiple letters follow the labno", {
  expect_equal(extract_suffix("WS123456_12345678ab"), "a")
})

test_that("suffix after a longer digit string returns NA", {
  expect_true(is.na(extract_suffix("WS123456_1234567890a")))
})

test_that("suffix from the first labno is returned when two labnos are present", {
  expect_equal(extract_suffix("12345678a_WS123456_23456789b"), "a")
})


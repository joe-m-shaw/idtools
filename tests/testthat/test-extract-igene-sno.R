test_that("extract_igene_sno works", {

  expect_equal(extract_igene_sno("WS123456_S25-AB12"),
               "S25-AB12")

})

test_that("extract_igene_sno returns NA when non-alphanumeric characters present", {
  expect_true(is.na(extract_igene_sno("WS123456_S25-$%£!")))
})

test_that("match is found when only iGene S number is included in input", {
  expect_equal(extract_igene_sno("S25-AB12"), "S25-AB12")
})

test_that("letter-only and number-only variants are matched", {
  expect_equal(extract_igene_sno("S25-1234"), "S25-1234")
  expect_equal(extract_igene_sno("S25-ABCD"), "S25-ABCD")
})

test_that("lowercase s in input returns NA", {
  expect_true(is.na(extract_igene_sno("s25-AB12")))
})

test_that("shorter and longer S numbers return NA", {
  expect_true(is.na(extract_igene_sno("S25-AB1")))
  expect_true(is.na(extract_igene_sno("S25-AB123")))
})

test_that("missing hyphen returns NA", {
  expect_true(is.na(extract_igene_sno("S25AB12")))
})

test_that("string with no S number returns NA not an error", {
  expect_true(is.na(extract_igene_sno("WS123456_12345678a")))
})

test_that("an R number in the input does not match as an S number", {
  expect_true(is.na(extract_igene_sno("WS123456_R25-AB12")))
})

test_that("first iGene S number is selected if multiple are supplied in one string", {
  expect_equal(extract_igene_sno("S25-1234_WS123456_12345678a_S26-ABCD.csv"),
               "S25-1234")
})

test_that("vectorised input is handled", {
  expect_equal(extract_igene_sno(c("Results_S26-12AB.csv",
                                   "Results_S26-34CD.csv",
                                   "Results_S26-56EF.csv",
                                   "Results_no_s_no.csv")),
               c("S26-12AB", "S26-34CD", "S26-56EF", NA))
})

test_that("filepath input is handled", {
  expect_equal(extract_igene_sno("drive:/folder1/folder2/S26-12AB/results/"),
               "S26-12AB")
})

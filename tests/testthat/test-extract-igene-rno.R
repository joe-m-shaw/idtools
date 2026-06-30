test_that("extract_igene_rno works with hyphen", {

  expect_equal(extract_igene_rno("WS123456_R26-12AB"),
               "R26-12AB")

})

test_that("extract_igene_rno returns NA when non-alphanumeric characters present",{

  expect_true(is.na(extract_igene_rno("WS123456_R26-$%£!")))

})

test_that("match is found when only iGene number is included in input", {

  expect_equal(extract_igene_rno("R26-12AB"),
               "R26-12AB")

})

test_that("letter-only and number-only variants are matched", {

  expect_equal(extract_igene_rno("R26-1234"),
               "R26-1234")

  expect_equal(extract_igene_rno("R26-ABCD"),
               "R26-ABCD")

})

test_that("lowercase r in input returns NA", {

  expect_true(is.na(extract_igene_rno("r26-12AB")))

})

test_that("shorter and longer R numbers return NA", {

  expect_true(is.na(extract_igene_rno("R26-12A")))

  expect_true(is.na(extract_igene_rno("R26-12ABC")))

})

test_that("missing hyphen returns NA", {

  expect_true(is.na(extract_igene_rno("R2612AB")))
})

test_that("string with no R number returns NA not an error", {

  expect_true(is.na(extract_igene_rno("WS123456_12345678a")))
})

test_that("first iGene R number is selected if multiple are supplied in one string", {

  expect_equal(extract_igene_rno("R25-1234_WS123456_12345678a_R26-ABCD.csv"),
               "R25-1234")

})

test_that("vectorised input is handled", {

  expect_equal(extract_igene_rno(c("Results_R26-12AB.csv",
                      "Results_R26-34CD.csv",
                      "Results_R26-56EF.csv",
                      "Results_no_r_no.csv")),
               c("R26-12AB",
                 "R26-34CD",
                 "R26-56EF",
                 NA))

})

test_that("filepath input is handled", {

  expect_equal(extract_igene_rno("drive:/folder1/folder2/R26-12AB/results/"),
               "R26-12AB")

})

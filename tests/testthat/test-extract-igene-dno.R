test_that("extract_igene_dno works", {

  expect_equal(extract_igene_dno("MPL-00001_D26-AB12_ctDNA_M1_T26-AB12"),
               "D26-AB12")

})

test_that("numeric-only and letter-only variants are matched", {
  expect_equal(extract_igene_dno("D26-1234"), "D26-1234")
  expect_equal(extract_igene_dno("D26-ABCD"), "D26-ABCD")
})

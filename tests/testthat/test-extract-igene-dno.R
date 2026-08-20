test_that("extract_igene_dno works", {

  expect_equal(extract_igene_dno("MPL-00001_D26-AB12_ctDNA_M1_T26-AB12"),
               "D26-AB12")

})

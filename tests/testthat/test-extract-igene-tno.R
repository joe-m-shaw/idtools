test_that("extract_igene_tno works", {

  expect_equal(extract_igene_tno("MPL-00001_D26-AB12_ctDNA_M1_T26-AB12"),
               "T26-AB12")

})

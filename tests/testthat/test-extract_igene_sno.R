test_that("extract_igene_sno works", {

  expect_equal(extract_igene_sno("WS123456_S25-AB12"),
               "S25-AB12")

})

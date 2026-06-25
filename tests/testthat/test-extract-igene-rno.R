test_that("extract_igene_rno works with hyphen", {

  expect_equal(extract_igene_rno("WS123456_R26-12AB"),
               "R26-12AB")

})

test_that("extract_igene_rno returns NA when non-alphanumeric characters present",{

  expect_warning(extract_igene_rno("WS123456_R26-$%£!"),
                 regexp = "NA value returned")

})

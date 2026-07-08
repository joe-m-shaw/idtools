test_that("extract_combined_plate works", {

  expect_equal(extract_combined_plate("WS123456_CP12345_results.csv"),
               "CP12345")

})


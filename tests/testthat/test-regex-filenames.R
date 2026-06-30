files <- c("Annotated_closed.xlsx",
           "~$Annotated_open.xlsx",
           "Results_SNVs_Indels_closed.xlsx",
           "~$Results_SNVs_Indels_open.xlsx")

test_that("regex_filenames doesn't select open Annotated Excel files", {

  expect_equal(grep(pattern = regex_filenames()$pansolid_excel_annotated,
                    x = files,
                    value = TRUE),
               "Annotated_closed.xlsx")

})

test_that("regex_filenames doesn't select open unannotated Excel files", {

  expect_equal(grep(pattern = regex_filenames()$pansolid_excel_unannotated,
                    x = files,
                    value = TRUE),
               "Results_SNVs_Indels_closed.xlsx")

})

test_that("pansolid_excel_annotated matches a valid annotated Excel file", {
  expect_true(grepl(pattern = regex_filenames()$pansolid_excel_annotated,
                    x = "Annotated_WS123456_12345678_AnnaKARENINA.xlsx"))
})

test_that("pansolid_excel_annotated does not match non-xlsx extensions", {
  expect_false(grepl(pattern = regex_filenames()$pansolid_excel_annotated,
                     x = "Annotated_WS123456_12345678.csv"))
  expect_false(grepl(pattern = regex_filenames()$pansolid_excel_annotated,
                     x = "Annotated_WS123456_12345678.json"))
})

test_that("pansolid_excel_annotated does not match lowercase prefix", {
  expect_false(grepl(pattern = regex_filenames()$pansolid_excel_annotated,
                     x = "annotated_WS123456_12345678.xlsx"))
})

test_that("pansolid_excel_annotated does not match when prefix is not at the start", {
  expect_false(grepl(pattern = regex_filenames()$pansolid_excel_annotated,
                     x = "Results_Annotated_WS123456_12345678.xlsx"))
})

test_that("pansolid_excel_annotated does not match unannotated filename", {
  expect_false(grepl(pattern = regex_filenames()$pansolid_excel_annotated,
                     x = "Results_SNVs_Indels_WS123456_12345678.xlsx"))
})

test_that("pansolid_excel_unannotated matches a valid unannotated Excel file", {
  expect_true(grepl(pattern = regex_filenames()$pansolid_excel_unannotated,
                    x = "Results_SNVs_Indels_WS123456_12345678_AnnaKARENINA.xlsx"))
})

test_that("pansolid_excel_unannotated does not match non-xlsx extensions", {
  expect_false(grepl(pattern = regex_filenames()$pansolid_excel_unannotated,
                     x = "Results_SNVs_Indels_WS123456_12345678.csv"))
  expect_false(grepl(pattern = regex_filenames()$pansolid_excel_unannotated,
                     x = "Results_SNVs_Indels_WS123456_12345678.json"))
})

test_that("pansolid_excel_unannotated does not match partial prefix", {
  expect_false(grepl(pattern = regex_filenames()$pansolid_excel_unannotated,
                     x = "Results_SNVs_WS123456_12345678.xlsx"))
})

test_that("pansolid_excel_unannotated does not match lowercase prefix", {
  expect_false(grepl(pattern = regex_filenames()$pansolid_excel_unannotated,
                     x = "results_SNVs_Indels_WS123456_12345678.xlsx"))
})

test_that("pansolid_excel_unannotated does not match annotated filename", {
  expect_false(grepl(pattern = regex_filenames()$pansolid_excel_unannotated,
                     x = "Annotated_WS123456_12345678.xlsx"))
})

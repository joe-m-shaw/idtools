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

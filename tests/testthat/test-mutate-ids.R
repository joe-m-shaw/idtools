df_expected <- tibble::tibble(
  "labno" = c("12345678"),
  "suffix" = c("a"),
  "worksheet" = c("WS123456"),
  "labno_suffix" = c("12345678a"),
  "labno_suffix_worksheet" = c("12345678a_WS123456")
)

test_that("mutate_ids works with old xlsx format without panel name", {

  input <- tibble::tibble(
    "filename" = "Annotated_WS123456_12345678a_PierreBEZUKHOV.xlsx"
  )

  expect_equal(mutate_ids(df = input, id_col = filename) |>
                 dplyr::select(-filename),
               df_expected)

})

test_that("mutate_ids works with multiple rows", {

  input <- tibble::tibble(
    "filename" = c("Annotated_WS123456_12345678a_PierreBEZUKHOV.xlsx",
                   "Annotated_WS123456_23456789b_AnnaKARENINA.xlsx",
                   "Annotated_WS123456_34567890c_IvanILYICH.xlsx")
  )

  df_expected <- tibble::tibble(
    "filename" = c("Annotated_WS123456_12345678a_PierreBEZUKHOV.xlsx",
                   "Annotated_WS123456_23456789b_AnnaKARENINA.xlsx",
                   "Annotated_WS123456_34567890c_IvanILYICH.xlsx"),
    "labno" = c("12345678", "23456789", "34567890"),
    "suffix" = c("a", "b", "c"),
    "worksheet" = c("WS123456", "WS123456", "WS123456"),
    "labno_suffix" = c("12345678a", "23456789b", "34567890c"),
    "labno_suffix_worksheet" = c("12345678a_WS123456", "23456789b_WS123456",
                                 "34567890c_WS123456")
  )

  expect_equal(mutate_ids(input, filename),
               df_expected)

})

test_that("mutate_ids works with new vcf format", {

  input <- tibble::tibble(
    "filename" = "hotspots_WS123456_12345678a_PierreBEZUKHOV_S26_R3_601.vcf"
  )

  expect_equal(mutate_ids(df = input, filename) |>
                 dplyr::select(-filename),
               df_expected)

})

test_that("mutate_ids works for annotated PanSolid format with panel name", {

  input <- tibble::tibble(
    "filename" = "Annotated_v2PANSOLID_WS123456_12345678a_PierreBEZUKHOV_S26_R3_601.xlsx"
  )

  expect_equal(mutate_ids(input, filename) |>
                 dplyr::select(-filename),
               df_expected)

})

test_that("mutate_ids works for unannotated PanSolid format", {

  input <- tibble::tibble(
    "filename" = "Results_SNVs_Indels-WS123456_12345678a_PierreBEZUKHOV_S26_R3_601.xlsx"
  )

  expect_equal(mutate_ids(input, filename) |>
                 dplyr::select(-filename),
               df_expected)

})

test_that("mutate_ids works for coverage txt file", {

  input <- tibble::tibble(
    "filename" = "Whole Panel Target UMI Coverage-WS123456_12345678_S35_R9_021.txt"
  )

  df_expected <- tibble::tibble(
    "filename" = "Whole Panel Target UMI Coverage-WS123456_12345678_S35_R9_021.txt",
    "labno" = c("12345678"),
    "suffix" = c(""),
    "worksheet" = c("WS123456"),
    "labno_suffix" = c("12345678"),
    "labno_suffix_worksheet" = c("12345678_WS123456")
  )

  expect_equal(mutate_ids(input, filename),
               df_expected)

})

test_that("mutate_ids works without name and with json format", {

  input <- tibble::tibble(
    "filename" = "Combined QC Reports-WS123456_12345678a_S2_R1_001.json"
  )

  df_expected <- tibble::tibble(
    "filename" = "Combined QC Reports-WS123456_12345678a_S2_R1_001.json",
    "labno" = c("12345678"),
    "suffix" = c("a"),
    "worksheet" = c("WS123456"),
    "labno_suffix" = c("12345678a"),
    "labno_suffix_worksheet" = c("12345678a_WS123456")
  )

  expect_equal(mutate_ids(input, filename),
               df_expected)

})

test_that("mutate_ids works with different column name and HTML file", {

  input <- tibble::tibble(
    "file" = "XX_WS123456_12345678b_PierreBEZUKHOV_all_log2ratios.html"
  )

  df_expected <- tibble::tibble(
    "file" = "XX_WS123456_12345678b_PierreBEZUKHOV_all_log2ratios.html",
    "labno" = c("12345678"),
    "suffix" = c("b"),
    "worksheet" = c("WS123456"),
    "labno_suffix" = c("12345678b"),
    "labno_suffix_worksheet" = c("12345678b_WS123456")
  )

  expect_equal(mutate_ids(input, id_col = file),
               df_expected)

})

test_that("spaces, full-stops and hyphens between identifiers are handled correctly", {

  input <- tibble::tibble(
    "filename" = c("Annotated WS123456 12345678a PierreBEZUKHOV.xlsx",
                   "Annotated.WS123456.23456789b.AnnaKARENINA.xlsx",
                   "Annotated-WS123456-34567890c-IvanILYICH.xlsx")
  )

  df_expected <- tibble::tibble(
    "filename" = c("Annotated WS123456 12345678a PierreBEZUKHOV.xlsx",
                   "Annotated.WS123456.23456789b.AnnaKARENINA.xlsx",
                   "Annotated-WS123456-34567890c-IvanILYICH.xlsx"),
    "labno" = c("12345678", "23456789", "34567890"),
    "suffix" = c("a", "b", "c"),
    "worksheet" = c("WS123456", "WS123456", "WS123456"),
    "labno_suffix" = c("12345678a", "23456789b", "34567890c"),
    "labno_suffix_worksheet" = c("12345678a_WS123456", "23456789b_WS123456",
                                 "34567890c_WS123456")
  )

  expect_equal(mutate_ids(input, filename),
               df_expected)

})

test_that("filename with a different order is handled correctly", {

  input <- tibble::tibble(
    "filename" = c("12345678_v2aSchwannAll_PS_WS123456_new.xlsx"))

  df_expected <- tibble::tibble(
    "filename" = c("12345678_v2aSchwannAll_PS_WS123456_new.xlsx"),
    "labno" = c("12345678"),
    "suffix" = c(""),
    "worksheet" = c("WS123456"),
    "labno_suffix" = c("12345678"),
    "labno_suffix_worksheet" = c("12345678_WS123456")
    )

  expect_equal(mutate_ids(input, filename),
               df_expected)

})

test_that("mutate_ids handles addition of dev in the filename", {

  input <- tibble::tibble(
    "filename" = c("Results_SNVs_Indels-WS123456dev_12345678_test.xlsx"))

    df_expected <- tibble::tibble(
      "filename" = c("Results_SNVs_Indels-WS123456dev_12345678_test.xlsx"),
      "labno" = c("12345678"),
      "suffix" = c(""),
      "worksheet" = c("WS123456"),
      "labno_suffix" = c("12345678"),
      "labno_suffix_worksheet" = c("12345678_WS123456")
    )

    expect_equal(mutate_ids(input, filename),
                 df_expected)

})

df_expected_rna <- tibble::tibble(
    "labno" = c("12345678"),
    "suffix" = c(""),
    "worksheet" = c("WS123456"),
    "labno_suffix" = c("12345678"),
    "labno_suffix_worksheet" = c("12345678_WS123456")
  )

test_that("RNA fusion QC filename is handled", {

  input <- tibble::tibble(
    "filename" = "Results_QC_for_Fusion_Panel_Report-WS123456_12345678_R1.xlsx"
  )

  expect_equal(mutate_ids(df = input, filename) |>
                 dplyr::select(-filename),
               df_expected_rna)

})

test_that("RNA fusion formatted filename is handled", {

  input <- tibble::tibble(
    "filename" = "Formatted_Results_WS123456_12345678.xlsx.xlsx"
  )

  expect_equal(mutate_ids(df = input, filename) |>
                 dplyr::select(-filename),
               df_expected_rna)

})

test_that("SeqOne HRD output filename is handled", {

  input <- tibble::tibble(
    "filename" = "WS123456_12345678a_hrd-results.csv"
  )

  expect_equal(mutate_ids(df = input, filename) |>
                 dplyr::select(-filename),
               df_expected)
})

test_that("rows with missing identifiers are included in messages", {

  df_with_missing_ids <- tibble::tribble(
    ~"filename",
    "WS123456_12345678",
    "WS_missing_12345678",
    "WS123456_labno_missing")

  messages <- capture_messages(mutate_ids(df = df_with_missing_ids,
                                          id_col = filename))

  expect_true(any(grepl("NA returned for labno at WS123456_labno_missing",
                        messages)))

  expect_true(any(grepl("NA returned for suffix at WS123456_labno_missing",
                        messages)))

  expect_true(any(grepl("NA returned for worksheet at WS_missing_12345678",
                        messages)))

})

test_that("input with worksheet already in colnames generates message", {

  input <- tibble::tibble(
    "filename" = "Annotated_WS123456_12345678a_PierreBEZUKHOV.xlsx",
    "worksheet" = "Worksheet for analysis")

  expect_message(mutate_ids(input, filename),
                 regexp = "Input already contains a column called worksheet. This will be replaced by the output of extract_worksheet.")

})

test_that("string input gives error", {

  expect_error(mutate_ids("12345678a_WS123456"),
               regexp = "input must be a dataframe")

})

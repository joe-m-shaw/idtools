# Regular expressions for filenames

`regex_filenames` is a function holding regular expressions (regex) for
different filename formats. These regex can be used for finding files
within the laboratory directories.

## Usage

``` r
regex_filenames()
```

## Value

A named list of regular expressions

## Note

Open Excel files:

When an Excel file is open, a temporary file with "~\$" at the start of
the filename will be created. Selecting these temporary files can lead
to issues when trying to read files with R. The "^" at the beginning of
each regex should mean that only non-temporary files are selected, which
is useful when combining `regex_filenames` with `list.files` in
directories where Excel files may already be open.

## Filenames

`regex_filenames` currently holds regex for the "Annotated" and
"unannotated" Excel outputs from the CLC pipelines for the PanSolid and
PanHaem next generation sequencing workflows.

## Examples

``` r

files <- c("Annotated_file.xlsx",
           "$Annotated_file.xlsx",
           "Annotated_file.json",
           "Annotated_file.csv")

grep(pattern = regex_filenames()$pansolid_excel_annotated, x = files, value = TRUE)
#> [1] "Annotated_file.xlsx"
```

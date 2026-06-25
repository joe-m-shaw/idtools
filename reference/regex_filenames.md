# Regular expressions for filenames

This function acts as a centralised place for storing regular
expressions for filenames.

## Usage

``` r
regex_filenames()
```

## Value

A named list of regular expressions

## Details

Primarily these are files which are outputted from CLC pipelines for the
PanSolid and PanHaem next generation sequencing workflows.

## Note

When an Excel file is open, a temporary file with "~\$" at the start of
the filename will be created. Selecting these temporary files can lead
to issues when trying to read files with R. The "^" at the beginning of
each regex should mean that only non-temporary files are selected, which
is useful when combining `regex_filenames` with `list.files` in
directories where Excel files may already be open.

## Examples

``` r

files <- c("Annotated_file.xlsx", "Annotated_file.json", "Annotated_file.csv")

grep(pattern = regex_filenames()$excel_annotated, x = files, value = TRUE)
#> [1] "Annotated_file.xlsx"
```

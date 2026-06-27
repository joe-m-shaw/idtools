# Extract worksheet from a character string

`extract_worksheet` extracts the worksheet identifier from an input
string, relying on `extract_id` and `regex_ids`. Details of the
worksheet number format are given in the documentation for `regex_ids`.

## Usage

``` r
extract_worksheet(input)
```

## Arguments

- input:

  A character string containing a worksheet identifier

## Value

The worksheet identifier as a string

## Examples

``` r
extract_worksheet("WS123456_12345678")
#> [1] "WS123456"
```

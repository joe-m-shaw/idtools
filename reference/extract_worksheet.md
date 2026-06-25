# Extract worksheet from a character string

The worksheet identifier is "WS" followed by 6 digits. Worksheet numbers
increase over time, and do not reset to 0 at the beginning of each year.

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

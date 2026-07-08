# Extract combined plate number from a character string

`extract_combined_plate` extracts the combined plate number from an
input string, using `extract_id` and `regex_ids`. A full description of
the format of the combined plate identifier is included in the
documentation for `regex_ids`.

## Usage

``` r
extract_combined_plate(input)
```

## Arguments

- input:

  A character string containing a combined plate number

## Value

The combined plate number as a string

## Examples

``` r
extract_combined_plate("WS123456_CP12345_results.csv")
#> [1] "CP12345"
```

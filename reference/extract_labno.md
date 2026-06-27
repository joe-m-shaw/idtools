# Extract lab number from a string

`extract_labno` extracts the DNA lab number (labno) from an input
string, using `extract_id` and `regex_ids`. A full description of the
format of the labno identifier is included in the documentation for
`regex_ids`.

## Usage

``` r
extract_labno(input)
```

## Arguments

- input:

  A character string containing a lab number

## Value

The lab number as a string

## Examples

``` r
extract_labno("WS123456_12345678")
#> [1] "12345678"
```

# Extract WGS patient number from a character string

`extract_wgs_patient_no` extracts the whole genome sequencing (WGS)
patient number from an input string, using `extract_id` and `regex_ids`.
A description of the format of the WGS patient number is included in the
documentation for `regex_ids`.

## Usage

``` r
extract_wgs_patient_no(input)
```

## Arguments

- input:

  A character string containing a WGS patient number

## Value

The WGS patient number as a string

## Examples

``` r
extract_wgs_patient_no("1234567890_p12345678901_LP1234567-DNA-reported_variants.csv")
#> [1] "p12345678901"
```

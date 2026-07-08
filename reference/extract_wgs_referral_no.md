# Extract WGS referral number from a character string

`extract_wgs_referral_no` extracts the whole genome sequencing (WGS)
referral number from an input string, using `extract_id` and
`regex_ids`. A description of the format of the WGS referral number is
included in the documentation for `regex_ids`.

## Usage

``` r
extract_wgs_referral_no(input)
```

## Arguments

- input:

  A character string containing a WGS referral number

## Value

The WGS referral number as a string

## Examples

``` r
extract_wgs_referral_no("Referral ID: r12345678901")
#> [1] "r12345678901"
```

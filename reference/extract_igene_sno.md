# Extract iGene S number from a character string

`extract_igene_sno` extracts the iGene sample number from a string,
using `extract_id` and `regex_ids`. A description of the format of iGene
sample numbers is included in the documentation for `regex_ids`.

## Usage

``` r
extract_igene_sno(input)
```

## Arguments

- input:

  A character string containing an iGene S number

## Value

The iGene S number as a string

## Examples

``` r
extract_igene_sno("WS123456_S26-12AB")
#> [1] "S26-12AB"
```

# Extract iGene R number from a character string

`extract_igene_rno` extracts the iGene referral number from a string,
using `extract_ids`. A description of the format of iGene referral
numbers is included in the documentation for `regex_ids`.

## Usage

``` r
extract_igene_rno(input)
```

## Arguments

- input:

  A character string containing an iGene R number

## Value

The iGene R number as a string

## Examples

``` r
extract_igene_rno("WS123456_R26-12AB")
#> [1] "R26-12AB"
```

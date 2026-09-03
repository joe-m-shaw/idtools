# Extract iGene D number from a character string

`extract_igene_dno` extracts the iGene derivative number from a string,
using `extract_ids`. A description of the format of iGene referral
numbers is included in the documentation for `regex_ids`.

## Usage

``` r
extract_igene_dno(input)
```

## Arguments

- input:

  A character string containing an iGene D number

## Value

The iGene D number as a string

## Examples

``` r
extract_igene_dno("MPL-00001_D26-AB12_ctDNA_M1_T26-AB12")
#> [1] "D26-AB12"
```

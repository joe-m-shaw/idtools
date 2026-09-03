# Extract iGene T number from a character string

`extract_igene_tno` extracts the iGene test number from a string, using
`extract_ids`. A description of the format of iGene referral numbers is
included in the documentation for `regex_ids`.

## Usage

``` r
extract_igene_tno(input)
```

## Arguments

- input:

  A character string containing an iGene T number

## Value

The iGene T number as a string

## Examples

``` r
extract_igene_tno("MPL-00001_D26-AB12_ctDNA_M1_T26-AB12")
#> [1] "T26-AB12"
```

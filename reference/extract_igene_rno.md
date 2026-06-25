# Extract iGene R number from a character string

The iGene database uses R numbers to identify individual referrals.

## Usage

``` r
extract_igene_rno(input)
```

## Arguments

- input:

  A character string containing an iGene R number

## Value

The iGene R number as a string

## Details

The R number is R, followed by the year as 2 digits (2026 = 26) and then
a random string of 5 alphanumeric characters.

## Examples

``` r
extract_igene_rno("WS123456_R26-12AB")
#> [1] "R26-12AB"
```

# Extract a sample replicate suffix from a string

When multiple replicates of a DNA lab number (labno) are tested on the
same worksheet, a letter is added directly after each labno.

## Usage

``` r
extract_suffix(input)
```

## Arguments

- input:

  A character string containing a lab number and a suffix

## Value

A character string of the suffix. Inputs without a suffix with return
"".

## Details

Example: 12345678a, 12345678b, 12345678c

## Examples

``` r
extract_suffix("WS123456_12345678a_replicate1")
#> [1] "a"
```

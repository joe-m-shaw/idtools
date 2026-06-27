# Extract a sample replicate suffix from a string

`extract_suffix` extracts the letter suffix from after a DNA lab number.
Letter suffixes are used when samples are tested in multiple replicates
(Examples: 12345678a, 12345678b, 12345678c). More detail is provided in
the documentation for `regex_ids`.

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

## Examples

``` r
# Example with suffix
extract_suffix("WS123456_12345678a_replicate1")
#> [1] "a"

# Empty string returned when no suffix is present
extract_suffix("WS123456_12345678_replicate1")
#> [1] ""
```

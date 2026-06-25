# Regular expressions for sample identifiers

This function is a centralised place for regular expressions for
extracting different identitiers. Regular expressions are written as raw
strings using
[`stringr::regex`](https://stringr.tidyverse.org/reference/modifiers.html)
which makes them easier to understand and maintain. The ["Regular
Expressions" chapter in "R for Data
Science"](https://r4ds.hadley.nz/regexps.html) is a great resource for
understanding regular expressions.

## Usage

``` r
regex_ids()
```

## Value

A named list of regular expressions for different identifiers

## Examples

``` r
regex_ids()$labno_suffix
#> $regex
#> [1] "\n        (^|\\D+)       # Either the start of string or non-digit characters (to\n                      # prevent pulling out 8 digits from longer digit strings)\n        (\\d{8})       # Lab number: 8 digits\n        ([a-z]{1}|)   # Suffix: either lowercase letter or empty\n        (\\D+|$)       # Either a non-digit character or end of the string\n        "
#> attr(,"options")
#> attr(,"options")$case_insensitive
#> [1] FALSE
#> 
#> attr(,"options")$comments
#> [1] TRUE
#> 
#> attr(,"options")$dotall
#> [1] FALSE
#> 
#> attr(,"options")$multiline
#> [1] FALSE
#> 
#> attr(,"class")
#> [1] "stringr_regex"   "stringr_pattern" "character"      
#> 
#> $labno_group
#> [1] 2
#> 
#> $suffix_group
#> [1] 3
#> 
```

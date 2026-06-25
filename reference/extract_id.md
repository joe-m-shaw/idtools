# Extract an identifier using regex

This is an internal helper function for exported functions such as
extract_labno, extract_worksheet and extract_suffix to reduce code
duplication when checking inputs and outputs.

## Usage

``` r
extract_id(input, pattern, group)
```

## Arguments

- input:

  The string to search

- pattern:

  The regular expression to match

- group:

  The group within the regular expression

## Value

The matching identifier from the string

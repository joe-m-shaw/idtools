# Add sample identifiers from a filename as new columns

`mutate_ids` extracts the three most common sample identifiers
(worksheet, labno and suffix) from a column within a dataframe, and adds
them as separate columns with
[`dplyr::mutate`](https://dplyr.tidyverse.org/reference/mutate.html).
Details on the formats of each identifier are included in the
documentation for `regex_ids`.

`mutate_ids` adds extra columns for labno, suffix and worksheet, and
then also concatenates the identifiers together as labno_suffix and
labno_suffix_worksheet. This is intended to given ultimate flexibility
when filtering or grouping data from multiple experiments.

This function is particularly effective when combined with the pipe
(\|\>) operator as it takes a dataframe as its input. Extra detail of
using `mutate_ids` is provided in the "Data analysis with idtools"
vignette.

## Usage

``` r
mutate_ids(df, id_col)
```

## Arguments

- df:

  The dataframe to add identifiers to

- id_col:

  The column in the dataframe which includes the filename.

## Value

The original dataframe with additional columns of identifiers from the
filename column

## Examples

``` r

# Dataframe of results from multiple files with filename as a column
results_df <- tibble::tribble(
~result, ~filename,
"Variant detected", "WS123456_12345678a_PierreBEZUKHOV.xlsx",
"Variant not detected", "WS123456_23456789_AnnaKARENINA.xlsx",
"Variant not detected", "WS123456_34567890_IvanILYICH.xlsx")

# Use `mutate_ids` to separate identifiers
results_df |>
  mutate_ids(filename)
#> # A tibble: 3 × 7
#>   result     filename labno suffix worksheet labno_suffix labno_suffix_worksheet
#>   <chr>      <chr>    <chr> <chr>  <chr>     <chr>        <chr>                 
#> 1 Variant d… WS12345… 1234… "a"    WS123456  12345678a    12345678a_WS123456    
#> 2 Variant n… WS12345… 2345… ""     WS123456  23456789     23456789_WS123456     
#> 3 Variant n… WS12345… 3456… ""     WS123456  34567890     34567890_WS123456     
```

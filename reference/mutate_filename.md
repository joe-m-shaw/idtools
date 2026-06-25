# Add filename and filepath to a dataframe

This function is a helper function to reduce code duplication for the
read\_.\*\_with_filename series of functions.

## Usage

``` r
mutate_filename(df, filepath)
```

## Arguments

- df:

  A dataframe

- filepath:

  The filepath of the file the dataframe has been read from

## Value

The dataframe with filepath and filename columns

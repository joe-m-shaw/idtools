# Add sample identifiers from filename as additional data columns

This function extracts the 3 common identifiers (worksheet, labno and
suffix) which are included in filenames.

## Usage

``` r
mutate_ids(df, id_col = filename)
```

## Arguments

- df:

  The dataframe to add identifiers to

- id_col:

  The column in the dataframe which includes the filename

## Value

The original dataframe with additional columns of identifiers from the
filename column

## Details

Patient name and NGS panel are both not included in `mutate_ids`, as
they are not always present in filenames.

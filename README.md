
<!-- README.md is generated from README.Rmd. Please edit that file -->

# idtools

<!-- badges: start -->
<!-- badges: end -->

`idtools` is an R package for extracting sample identifiers from
filenames at the North West Genomic Laboratory Hub in Manchester, United
Kingdom. It is intended to be used for validation or development
projects, where key information, such as the DNA lab number, worksheet
number and replicate suffix, are concatenated within the filename.

The name is a pun on the concept of “tidy tools” from the [“Tidy Tools
Manifesto”](https://tidyverse.tidyverse.org/articles/manifesto.html) by
Hadley Wickham.

## Installation

You can install the development version of idtools from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("joe-m-shaw/idtools")
#> ℹ Loading metadata database✔ Loading metadata database ... done
#>  
#> → Package library at 'C:\Users\joseph.shaw2\AppData\Local\Temp\RtmpAVPak3\temp_libpath71e032d53565'.
#> → Will install 24 packages.
#> → Will update 1 package.
#> → Will download 24 CRAN packages (28.62 MB).
#> → Will download 1 package with unknown size.
#> + cli                     3.6.6      [cmp][dl] (1.41 MB)
#> + dplyr                   1.2.1      [cmp][dl] (1.62 MB)
#> + generics                0.1.4      [dl] (85.14 kB)
#> + glue                    1.8.1      [cmp][dl] (189.63 kB)
#> + hms                     1.1.4      [dl] (109.35 kB)
#> + idtools    0.0.0.9000 → 0.0.0.9000 [bld][cmp][dl] (GitHub: b806557)
#> + janitor                 2.2.1      [dl] (292.49 kB)
#> + lifecycle               1.0.5      [dl] (149.70 kB)
#> + lubridate               1.9.5      [cmp][dl] (989.73 kB)
#> + magrittr                2.0.5      [cmp][dl] (229.13 kB)
#> + pillar                  1.11.1     [dl] (673.42 kB)
#> + pkgconfig               2.0.3      [dl] (22.81 kB)
#> + purrr                   1.2.2      [cmp][dl] (571.27 kB)
#> + R6                      2.6.1      [dl] (88.64 kB)
#> + rlang                   1.2.0      [cmp][dl] (1.65 MB)
#> + snakecase               0.11.1     [dl] (168.50 kB)
#> + stringi                 1.8.7      [cmp][dl] (15.03 MB)
#> + stringr                 1.6.0      [dl] (350.12 kB)
#> + tibble                  3.3.1      [cmp][dl] (667.16 kB)
#> + tidyr                   1.3.2      [cmp][dl] (1.27 MB)
#> + tidyselect              1.2.1      [cmp][dl] (228.15 kB)
#> + timechange              0.4.0      [cmp][dl] (516.18 kB)
#> + utf8                    1.2.6      [cmp][dl] (154.70 kB)
#> + vctrs                   0.7.3      [cmp][dl] (1.92 MB)
#> + withr                   3.0.3      [dl] (231.37 kB)
#> ℹ Getting 24 pkgs (28.62 MB) and 1 pkg with unknown size
#> ✔ Cached copy of dplyr 1.2.1 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of generics 0.1.4 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of glue 1.8.1 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of hms 1.1.4 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of janitor 2.2.1 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of lubridate 1.9.5 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of magrittr 2.0.5 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of pillar 1.11.1 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of purrr 1.2.2 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of snakecase 0.11.1 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of stringi 1.8.7 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of stringr 1.6.0 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of tibble 3.3.1 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of tidyr 1.3.2 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of tidyselect 1.2.1 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of timechange 0.4.0 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Cached copy of utf8 1.2.6 (i386+x86_64-w64-mingw32) is the latest build
#> ✔ Got idtools 0.0.0.9000 (source) (47.57 kB)
#> ✔ Got pkgconfig 2.0.3 (i386+x86_64-w64-mingw32) (22.97 kB)
#> ✔ Got withr 3.0.3 (i386+x86_64-w64-mingw32) (232.06 kB)
#> ✔ Got R6 2.6.1 (i386+x86_64-w64-mingw32) (88.72 kB)
#> ✔ Got lifecycle 1.0.5 (i386+x86_64-w64-mingw32) (149.48 kB)
#> ✔ Got cli 3.6.6 (i386+x86_64-w64-mingw32) (1.40 MB)
#> ✔ Got rlang 1.2.0 (i386+x86_64-w64-mingw32) (1.64 MB)
#> ✔ Got vctrs 0.7.3 (i386+x86_64-w64-mingw32) (1.89 MB)
#> ✔ Installed dplyr 1.2.1  (950ms)
#> ✔ Installed generics 0.1.4  (1.3s)
#> ✔ Installed glue 1.8.1  (2.2s)
#> ✔ Installed hms 1.1.4  (2.2s)
#> ✔ Installed janitor 2.2.1  (2.2s)
#> ✔ Installed lifecycle 1.0.5  (2.4s)
#> ✔ Installed pkgconfig 2.0.3  (2.4s)
#> ✔ Installed magrittr 2.0.5  (2.8s)
#> ✔ Installed pillar 1.11.1  (3s)
#> ✔ Installed lubridate 1.9.5  (3.4s)
#> ✔ Installed purrr 1.2.2  (3.3s)
#> ✔ Installed cli 3.6.6  (4.2s)
#> ✔ Installed R6 2.6.1  (2.8s)
#> ✔ Installed rlang 1.2.0  (2.3s)
#> ✔ Installed snakecase 0.11.1  (2.2s)
#> ✔ Installed stringr 1.6.0  (2.1s)
#> ✔ Installed tibble 3.3.1  (1.9s)
#> ✔ Installed stringi 1.8.7  (2.3s)
#> ✔ Installed tidyr 1.3.2  (2s)
#> ✔ Installed tidyselect 1.2.1  (1.7s)
#> ✔ Installed timechange 0.4.0  (1.5s)
#> ✔ Installed utf8 1.2.6  (1.3s)
#> ✔ Installed withr 3.0.3  (1s)
#> ✔ Installed vctrs 0.7.3  (1.3s)
#> ℹ Packaging idtools 0.0.0.9000
#> ✔ Packaged idtools 0.0.0.9000 (1.7s)
#> ℹ Building idtools 0.0.0.9000
#> ✔ Built idtools 0.0.0.9000 (1.9s)
#> ✔ Installed idtools 0.0.0.9000 (github::joe-m-shaw/idtools@b806557) (149ms)
#> ✔ 1 pkg + 24 deps: upd 1, added 24, dld 8 (NA B) [22.3s]
```

## Example

You can use `idtools` to extract sample identifiers stored in filenames.

``` r

library(idtools)

filename <- "WS123456_12345678a"

extract_worksheet(filename)
#> [1] "WS123456"

extract_labno(filename)
#> [1] "12345678"

extract_suffix(filename)
#> [1] "a"
```

## Information Governance

**No patient identifiable information should be included in this
repository.**

If you spot some, please let me know.

For the purpose of testing functions, I have used generic examples for
worksheet (WS123456) and lab number (12345678) values.

Where examples of patient names are required, I have used character
names from novels by Leo Tolstoy (Anna Karenina, Pierre Bezukhov etc).


<!-- README.md is generated from README.Rmd. Please edit that file -->

# do

🌊 R client for [DigitalOcean’s API](https://developers.digitalocean.com)

## Installation

You can install the dev version from [Github](https://github.com) with:

``` r
## install from Github
devtools::install_github("mkearney/do")
```

## Account

``` r
## view account info
do_account()
#> # A tibble: 1 x 7
#>   droplet_limit floating_ip_lim… email uuid  email_verified status
#>           <int>            <int> <chr> <chr> <lgl>          <chr> 
#> 1            10                3 mike… 3edb… TRUE           active
#> # ... with 1 more variable: status_message <chr>
```

## Droplets

``` r
## create droplet
do_droplet()
```

## Contributions

Please note that the ‘do’ project is released with a [Contributor Code
of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you
agree to abide by its terms.

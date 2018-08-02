
#' Create droplot
#'
#' Create a new droplet
#'
#' @param parse Logical indicating whether to convert response into a tibble.
#'   Defaults to yes.
#' @return Either a response object or a tibble
#' @export
do_droplot <- function(parse = TRUE) {
  r <- do_api_get("droplets", ...)
  if (parse) {
    r <- do_as_tbl(r)
  }
  r
}


do_api_call <- function(...) {
  ## capture dots
  dots <- list(...)

  ## base url: if missing, set to default
  if (!"base_url" %in% names(dots)) {
    base_url <- "https://api.digitalocean.com/v2/"
  } else {
    base_url <- dots$base_url
    dots$base_url <- NULL
  }
  base_url <- sub("/$", "", base_url)

  ## path: assume first unnamed arg; if missing, set to empty
  if ("path" %in% names(dots)) {
    path <- dots$path
    dots$path <- NULL
  } else if (length(dots) > 0 &&
      (is.null(names(dots)) || identical(names(dots)[1], ""))) {
    path <- dots[1]
    dots <- dots[-1]
  } else {
    path <- ""
  }
  path <- gsub("^/", "", path)

  ## build url
  if (!identical(path, "")) {
    url <- paste0(base_url, "/", path)
  } else {
    url <- base_url
  }

  ## if query/params sent as list, unlist
  if (length(dots) == 1L && is.list(dots[[1]])) {
    dots <- dots[[1]]
  }

  ## if params provided, enter params
  if (length(dots) > 0L) {
    dots <- paste0(names(dots), "=", dots)
    dots <- paste(dots, collapse = "&")
    url <- paste0(url, "?", dots)
  }

  ## return url
  url
}

#' GET digitalocean API
#'
#' Send GET requests to digitalocean's API
#'
#' @param ... Path and query string components (endpoint parameters) should be
#'   supplied here. If unnamed, the first object is assumed to be the API path
#'   path, which is the string pointing to the desired API endpoint
#'   \code{users/self}. Additional named arguments supplied here will be included
#'   as part of the query string (trailing the "?" in the URL).
#' @return An HTTP response object.
#' @examples
#' \dontrun{
#' ## make custom request to locations/search endpoint
#' do_locs <- do_api_get("path/name", arg1 = TRUE, arg2 = 0)
#'
#' ## view data
#' do_as_tbl(do_locs)
#' }
#' @export
do_api_get <- function(...) {
  ## build and make request
  r <- httr::GET(do_api_call(...), do_token())

  ## check status
  httr::warn_for_status(r)

  ## return data/response
  r
}

#' POST digitalocean API
#'
#' Send POST requests to digitalocean's API
#'
#' @param ... Path and query string components (endpoint parameters) should be
#'   supplied here. If unnamed, the first object is assumed to be the API path
#'   path, which is the string pointing to the desired API endpoint
#'   \code{users/self}. Additional named arguments supplied here will be included
#'   as part of the query string (trailing the "?" in the URL).
#' @return An HTTP response object.
#' @export
do_api_post <- function(...) {
  ## build and make request
  r <- httr::POST(do_api_call(...))

  ## check status
  httr::warn_for_status(r)

  ## return data/response
  invisible(r)
}

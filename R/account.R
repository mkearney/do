
#' Account info
#'
#' Get Digital Ocean account info
#'
#' @param parse Logical indicating whether to convert response into a tibble.
#'   Defaults to yes.
#' @details
#'
#' \itemize{
#' \item droplet_limit	integer	The total number of Droplets current user or team
#' may have active at one time.
#'
#' \item floating_ip_limit	integer	The total number of Floating IPs the current
#' user or team may have.
#'
#' \item email	string	The email address used by the current user to registered
#' for DigitalOcean.
#'
#' \item uuid	string	The unique universal identifier for the current user or
#' team.
#'
#' \item email_verified	boolean	If true, the user has verified their account via
#' email. False otherwise.
#'
#' \item status	string	This value is one of "active", "warning" or "locked".
#'
#' \item status_message	string	A human-readable message giving more details
#' about the status of the account.
#' }
#' @return Either a response object or a tibble
#' @export
do_account <- function(parse = TRUE) {
  r <- do_api_get("account")
  if (parse) {
    r <- do_as_tbl(r)
  }
  r
}

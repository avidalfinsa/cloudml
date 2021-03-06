cloudml_job <- function(class, id, description) {
  structure(
    list(
      id = id,
      description = description
    ),

    class = c(
      sprintf("cloudml_job_%s", class),
      "cloudml_job"
    )
  )
}

as.cloudml_job <- function(x) {
  UseMethod("as.cloudml_job")
}

#' @export
as.cloudml_job.character <- function(x) {
  resolve_job(x)
}

#' @export
as.cloudml_job.cloudml_job <- function(x) {
  x
}

#' @export
print.cloudml_job <- function(x, ...) {
  header <- "<cloudml job>"
  cat(header, sep = "\n")

  text <- yaml::as.yaml(x)
  cat(text, sep = "\n")

  x
}

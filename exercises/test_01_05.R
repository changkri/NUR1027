test <- function() {
  # Here we can either check objects created in the solution code, or the
  # string value of the solution, available as .solution. See the testTemplate
  # in the meta.json for details.
  if (!grepl("[MeSH]", .solution, fixed = TRUE)) {
    stop("Try using a MeSH term for one of the terms to cut down the number of results")
  }
  if (!grepl("OR", .solution, fixed = TRUE)) {
    stop("Try combining some more synonyms using OR")
  }
  if (!grepl("nurs*", .solution, fixed = TRUE)) {
    stop("Try using the wildcard * to capture the different terms for nursing")
  }
  if (!grepl(") AND", .solution, fixed = TRUE)) {
    stop("We need to wrap the synonyms that were combined with OR in brackets before combining them with AND rounding[TIAB]")
  }
  # This function is defined in the testTemplate
  success("Great work! Combining the different synonyms with rounding really increased how many results were returned by the search but still kept it within a reasonable number to filter through.")
}
    
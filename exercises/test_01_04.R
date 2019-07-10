test <- function() {
  # Here we can either check objects created in the solution code, or the
  # string value of the solution, available as .solution. See the testTemplate
  # in the meta.json for details.
  if (!grepl("AND", .solution, fixed = TRUE)) {
    stop("The boolean operator that will reduce the number of results returned by a search is AND.")
  }
  if (!grepl("rounding[TI", .solution, fixed = TRUE)) {
    stop("Try using the [TI] or [TIAB] search tag")
  }
  
  # This function is defined in the testTemplate
  success("That was too easy! Let's try something a little more challenging.")
}
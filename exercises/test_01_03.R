test <- function() {
    # Here we can either check objects created in the solution code, or the
    # string value of the solution, available as .solution. See the testTemplate
    # in the meta.json for details.
    if (!grepl("nursing[MeSH]", .solution, fixed = TRUE)) {
        stop("Replace the dotted lines with the word nursing. For the solution or a hint, 
press the buttons below")
    }
    # This function is defined in the testTemplate
    success("Well done!")
}

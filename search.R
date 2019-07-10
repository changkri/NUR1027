library(RISmed)
search <- function(keyword){
  QueryCount(EUtilsSummary(keyword)) 
}
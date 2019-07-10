library(tidyverse)
library(hypothesisr)
test <- hs_search(uri = "https://nur1027-fall-2019.netlify.com/")
## Probably better to match in the search because there is a limit of 200 results
chapter1_any <- hs_search(uri = "https://nur1027-fall-2019.netlify.com/", any = "chapter1")
chapter1 <- test %>% 
filter(stringr::str_detect(uri, 'chapter1'))

# annotations of specific pdfs
pdf <- hs_search(uri = "https://www.aaronconway.info/NUR1027/dobrow.pdf")
# combine with others in same chapter
combined <- rbind(chapter1_any, pdf)

library(rcanvas)
set_canvas_token("11834~gqHvGv1Up2T1Ms8xbVsscLA59nHcj0TkRpsQ00qiCZXHtd6BDkNPm950pNTYe8ls")
set_canvas_domain("https://q.utoronto.ca")
token <-  "11834~gqHvGv1Up2T1Ms8xbVsscLA59nHcj0TkRpsQ00qiCZXHtd6BDkNPm950pNTYe8ls"
list <- get_course_list()
test <- get_discussions_context(list$id[1])
context <- get_discussions_context(list$id[1] )
discussion <- get_discussion_id(discussion_id = 320618, object_id = list$id[1])


# This does not return usernames but worked with >100 posts
args <- list(per_page = 200)

resp <- httr::GET("https://q.utoronto.ca/api/v1/courses/86697/discussion_topics/320618/view", 
          httr::add_headers(Authorization = paste("Bearer", token)),
          query = args)

library(tidyverse)
resplist <- list(resp)
respbody <- resplist %>%
  purrr::map(httr::content, "text") %>%
  purrr::map(jsonlite::fromJSON, flatten = TRUE)

df <- respbody %>% purrr::flatten_df()
# replies to messages
df$replies

# This returns usernames - view doesn't (works with returning 100 of the most recent messages)
resp <- httr::GET("https://q.utoronto.ca/api/v1/courses/86697/discussion_topics/320618/entries", 
                  httr::add_headers(Authorization = paste("Bearer", token)),
                  query = args)

library(tidyverse)
resplist <- list(resp)
respbody <- resplist %>%
  purrr::map(httr::content, "text") %>%
  purrr::map(jsonlite::fromJSON, flatten = TRUE)

df <- respbody %>% purrr::flatten_df()
# replies to messages (but only up to 10 replies to original messages)
df$recent_replies

# Updates the topic of the discussion
update_discussion_id(discussion_id = 320618, object_id = list$id[1], message = "This is an update to the discussion board")

# Post a reply 100 TIMES
message  <- list(message="Updated reply")
replicate(100, httr::POST("https://q.utoronto.ca/api/v1/courses/86697/discussion_topics/320618/entries", 
                  httr::add_headers(Authorization = paste("Bearer", token)),
                  query = message))


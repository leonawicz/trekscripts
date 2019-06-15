library(trekdata)
library(dplyr)
x <- st_script_download("episode_scripts", TRUE)
system.time(x <- dplyr::mutate(x, text2 = purrr::map(text, st_script_text_df))) # ~10 minutes

x1 <- select(x, -text2) %>% rename(raw_text = text)
x2 <- select(x, -text) %>% rename(text = text2)
saveRDS(x1, "raw.rds")
saveRDS(x2, "prepped.rds")

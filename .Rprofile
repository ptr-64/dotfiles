# Peter's R profile
# The .First function is called after everything else in .Rprofile is executed
.First <- function() {
  rm(list=ls())
  # Print a welcome message
  message("Welcome back ", Sys.getenv("USER"),"!\n","you are in: ", getwd(), "!\n", "and your working memory has been cleared.")
}

options(digits = 5)
options(stringsAsFactors = FALSE)
options(browser = '/usr/bin/firefox')
options(na.action = na.warn)
error <- quote(dump.frames(str(./dump), to.file=TRUE))

## Set CRAN mirror:
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cloud.r-project.org/"
  options(repos = r)
})

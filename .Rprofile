# Peter's R profile
# The .First function is called after everything else in .Rprofile is executed
.First <- function() {
  # Print a welcome message
  message("Welcome back ", Sys.getenv("USER"),"!\n","you are in: ", getwd(), "!\n", "it is a lovely day on ", date(), "!\n", "and your working memory has been cleared (not via `rm(list=ls())`, this is a fresh session).")
}

# options(digits = 5)
options(warnPartialMatchAttr = TRUE,
        warnPartialMatchDollar = TRUE,
        tab.width =2,
        browser = "/usr/bin/firefox"
)

error_dump <- quote(dump.frames(str(./dump), to.file=TRUE))

if (!interactive())
    options(error = function(){
        traceback(2, max.lines = 10)
        quit(save="no", status = 1)
    }
    )

## Set CRAN mirror:
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cloud.r-project.org/"
  options(repos = r)
})

rfrsh <- function() {
  assign('.Last',  function() {system('R')}, envir = globalenv())
  quit(save = 'no')
}

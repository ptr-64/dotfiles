# Peter's R profile
# The .First function is called after everything else in .Rprofile is executed
.First <- function() {
  # Print a welcome message
  message("Welcome back ", Sys.getenv("USER"),"!\n","you are in: ", getwd(), "!\n", "it is a lovely day on ", date(), "!\n", "and your working memory has been cleared (not via `rm(list=ls())`, this is a fresh session).")
}

# options(digits = 5)
options(prompt = "R~> ",
        digits = 4,
        show.signif.stars = FALSE,
        warnPartialMatchAttr = TRUE,
        warnPartialMatchDollar = TRUE,
        tab.width =2,
        browser = "/usr/bin/firefox",
        stringsAsFactor = FALSE,
	max.print = 199,
	tigris_use_cache = TRUE
)

local({
        n <- parallel::detectCores()
        options(Ncps = n)
        options(mc.cores = n)
}
)
error_dump <- quote(dump.frames("${R_HOME_USER}/testdump", TRUE)
)

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
  rm(r)
})

rfrsh <- function() {
  assign('.Last',  function() {system('R')}, envir = globalenv())
  quit(save = 'no')
}

setHook(packageEvent("grDevices", "onLoad"),
        function(...) grDevices::X11.options(width=8, height=8, 
                                             xpos=0, pointsize=10, 
                                             #type="nbcairo"))  # Cairo device
                                             #type="cairo"))    # other Cairo dev
                                             type="xlib"))      # old default

# loadviews.R
# code from: https://github.com/PTB-OEDA/VIEWS-Startup

library(arrow)

# CM level data: features and outcomes path
dl_link <- "https://www.dropbox.com/scl/fo/rkj4ttawoz9pv6x35r9cq/ACi53p087OvQUke0pIg88pg/cm_level_data/cm_data_121_542.parquet?rlkey=44eg0kk4w8yh8tm1f53vvpzps&dl=1"

# File name once downloaded
destfile <- "cm_data_121_542.parquet"

# DL with curl
curl::curl_download(url = dl_link, destfile = destfile)

# This is the main data file being read into R
cm <- read_parquet("cm_data_121_542.parquet")

###
## Repeat the above with the data for the country labels and the month ids
##

# Get the list of country names as well to add to the data
# These are from the main VIEWS site
dl_link2 <- "https://www.dropbox.com/scl/fo/rurpcmtpcquni5onoyuus/AGeR6dD-Ru-Emwn06HnKAE8/matching_tables?preview=countries.csv&rlkey=v1o4va647qrwc4la7m8i7cedk&subfolder_nav_tracking=1&st=goucd0hg&dl=1"

# File name declared
destfile2 <- "country.zip"

# DL with curl
curl::curl_download(url = dl_link2, destfile = destfile2)

# Unzip
zip::unzip(zipfile = "country.zip", exdir="countries")

# Read it
countries <- read.csv("countries/countries.csv", header = TRUE)

# Month to date maps
dl_link3 <- "https://www.dropbox.com/scl/fo/rurpcmtpcquni5onoyuus/AGeR6dD-Ru-Emwn06HnKAE8/matching_tables?preview=month_ids.csv&rlkey=v1o4va647qrwc4la7m8i7cedk&subfolder_nav_tracking=1&st=l8g86mv4&dl=1"

destfile3 <- "month_ids.zip"
curl::curl_download(url = dl_link3, destfile = destfile3)
zip::unzip(zipfile = "month_ids.zip", exdir="month_ids")
month_ids <- read.csv("month_ids/month_ids.csv", header = TRUE)


library(tidyverse)

# Use Selenized Dark as template


# Create db
# Specs from https://github.com/jan-warchol/selenized/blob/master/the-values.md
tb <- tibble(colnames = c(
  "bg_0", "bg_1", "bg_2", "dim_0", "fg_0", "fg_1", "red", "green", "yellow",
  "blue", "magenta", "cyan", "orange", "violet", "br_red", "br_green",
  "br_yellow", "br_blue", "br_magenta", "br_cyan", "br_orange", "br_violet"
))

tb$Selenized_Dark <- c(
  "#103c48", "#174956", "#325b66", "#72898f", "#adbcbc", "#cad8d9", "#fa5750",
  "#75b938", "#dbb32d", "#4695f7", "#f275be", "#41c7b9", "#ed8649", "#af88eb",
  "#ff665c", "#84c747", "#ebc13d", "#58a3ff", "#ff84cd", "#53d6c7", "#fd9456",
  "#bd96fa"
) %>%
  toupper()

tb$OKSolar_Dark <- c(
  "#002d38", "#093946", "#657377", "#5b7279", "#98a8a8", "#8faaab", "#f23749",
  "#819500", "#ac8300", "#2b90d8", "#dd459d", "#259d94", "#d56500", "#7d80d1",
  "#f23749", "#819500", "#ac8300", "#2b90d8", "#dd459d", "#259d94", "#d56500",
  "#7d80d1"
) %>% toupper()

tb$OKSolar_Light <- c(
  "#fbf7ef", "#f1e9d2", "#98a8a8", "#8faaab", "#657377", "#5b7279", "#f23749",
  "#819500", "#ac8300", "#2b90d8", "#dd459d", "#259d94", "#d56500", "#7d80d1",
  "#f23749", "#819500", "#ac8300", "#2b90d8", "#dd459d", "#259d94", "#d56500",
  "#7d80d1"
) %>% toupper()




# Iterator

ncols <- seq_len(nrow(tb))

# 1. tmTheme distros ----

## Templates based on selenized.dark -----
input_tm <- "src/selenized/Selenized Dark.tmTheme"
tm_lines <- readLines(input_tm)

### Black ----

new_tm <- tm_lines

for (c in ncols) {
  new_tm <- gsub(tb$Selenized_Dark[c],
    tb$OKSolar_Dark[c], new_tm,
    ignore.case = TRUE
  )
}

# Rename and output
new_tm <- gsub(
  "dark.selenized_dark",
  "dark.oksolar_dark", new_tm
)

new_tm <- gsub("Selenized Dark", "OKSolar Dark", new_tm)

output_f <- file.path("extras/textmate/OKSolar Dark.tmTheme")

writeLines(new_tm, output_f)

# Create also a new R script
input_r <- "./src/selenized/01_selenized.dark_guis.R"
r_lines <- readLines(input_r)
new_r <- gsub("Selenized Dark", "OKSolar Dark", r_lines)

output_r <- "./src/01_oksolar.dark_guis.R"

writeLines(new_r, output_r)

### Light ----

new_tm <- tm_lines

for (c in ncols) {
  new_tm <- gsub(tb$Selenized_Dark[c],
    tb$Selenized_Light[c], new_tm,
    ignore.case = TRUE
  )
}

# Rename and output
new_tm <- gsub(
  "dark.selenized_dark",
  "light.selenized_light", new_tm
)
new_tm <- gsub("Selenized Dark", "Selenized Light", new_tm)

output_f <- gsub("Selenized Dark", "Selenized Light", input_tm)

writeLines(new_tm, output_f)

# Create also a new R script
r_lines <- readLines(input_r)
new_r <- gsub("Selenized Dark", "Selenized Light", r_lines)

output_r <- gsub("selenized.dark", "selenized.light", input_r)

writeLines(new_r, output_r)



### White ----

new_tm <- tm_lines

for (c in ncols) {
  new_tm <- gsub(tb$Selenized_Dark[c],
    tb$Selenized_White[c], new_tm,
    ignore.case = TRUE
  )
}

# Rename and output
new_tm <- gsub(
  "dark.selenized_dark",
  "light.selenized_white", new_tm
)
new_tm <- gsub("Selenized Dark", "Selenized White", new_tm)

output_f <- gsub("Selenized Dark", "Selenized White", input_tm)

writeLines(new_tm, output_f)

# Create also a new R script
r_lines <- readLines(input_r)
new_r <- gsub("Selenized Dark", "Selenized White", r_lines)

output_r <- gsub("selenized.dark", "selenized.white", input_r)

writeLines(new_r, output_r)

# 2. CSS variants ----


## Templates based on selenized.dark -----

css_templates <- list.files("./src/themes", "selenized.dark",
  full.names = TRUE
)

### Black ----

for (this_template in css_templates) {
  css_lines <- readLines(this_template)
  new_css <- css_lines

  for (c in ncols) {
    new_css <- gsub(tb$Selenized_Dark[c],
      tb$Selenized_Black[c], new_css,
      ignore.case = TRUE
    )
  }

  # Rename and output
  new_css <- gsub("selenized.dark", "selenized.black", new_css)

  output_f <- gsub("selenized.dark", "selenized.black", this_template)

  writeLines(new_css, output_f)
}

### Light ----

for (this_template in css_templates) {
  css_lines <- readLines(this_template)
  new_css <- css_lines

  for (c in ncols) {
    new_css <- gsub(tb$Selenized_Dark[c],
      tb$Selenized_Light[c], new_css,
      ignore.case = TRUE
    )
  }

  # Rename and output
  new_css <- gsub("selenized.dark", "selenized.light", new_css)

  output_f <- gsub("selenized.dark", "selenized.light", this_template)

  writeLines(new_css, output_f)
}

### White ----

for (this_template in css_templates) {
  css_lines <- readLines(this_template)
  new_css <- css_lines

  for (c in ncols) {
    new_css <- gsub(tb$Selenized_Dark[c],
      tb$Selenized_White[c], new_css,
      ignore.case = TRUE
    )
  }

  # Rename and output
  new_css <- gsub("selenized.dark", "selenized.white", new_css)

  output_f <- gsub("selenized.dark", "selenized.white", this_template)

  writeLines(new_css, output_f)
}

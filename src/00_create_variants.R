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

tb$OKSolar_Red <- c(
  "#3C1C1C", "#4A2726", "#7a6c6c", "#7D6665", "#A6A498", "#B1A469", "#F23749",
  "#819500", "#AC8300", "#2B90D8", "#DD459D", "#259D94", "#D56500", "#7D80D1",
  "#F23749", "#819500", "#AC8300", "#2B90D8", "#DD459D", "#259D94", "#D56500",
  "#7D80D1"
) %>% toupper()

tb$OKSolar_Green <- c(
  "#162D17", "#203A21", "#697169", "#637163", "#A6A498", "#B1A469", "#F23749",
  "#819500", "#AC8300", "#2B90D8", "#DD459D", "#259D94", "#D56500", "#7D80D1",
  "#F23749", "#819500", "#AC8300", "#2B90D8", "#DD459D", "#259D94", "#D56500",
  "#7D80D1"
) %>% toupper()

tb$OKSolar_Purple <- c(
  "#331E34", "#402942", "#746b74", "#766776", "#A1A59A", "#98AD75", "#F23749",
  "#819500", "#AC8300", "#2B90D8", "#DD459D", "#259D94", "#D56500", "#7D80D1",
  "#F23749", "#819500", "#AC8300", "#2B90D8", "#DD459D", "#259D94", "#D56500",
  "#7D80D1"
) %>% toupper()

tb$OKSolar_Blue <- c(
  "#1a2740", "#26334d", "#6a707c", "#646d7f", "#b19f95", "#b59e91", "#F23749",
  "#819500", "#AC8300", "#2B90D8", "#DD459D", "#259D94", "#D56500", "#7D80D1",
  "#F23749", "#819500", "#AC8300", "#2B90D8", "#DD459D", "#259D94", "#D56500",
  "#7D80D1"
) %>% toupper()

tb$OKSolar_Sky <- c(
  "#eff9fe", "#d4eef9", "#98a7a9", "#8faaae", "#796e66", "#7a695e", "#f23749",
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

output_f <- file.path("dist/tmtheme/OKSolar Dark.tmTheme")

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
    tb$OKSolar_Light[c], new_tm,
    ignore.case = TRUE
  )
}

# Rename and output
new_tm <- gsub(
  "dark.selenized_dark",
  "light.oksolar_light", new_tm
)
new_tm <- gsub("Selenized Dark", "OKSolar Light", new_tm)

output_f <- file.path("dist/tmtheme/OKSolar Light.tmTheme")



writeLines(new_tm, output_f)

# Create also a new R script
r_lines <- readLines(input_r)
new_r <- gsub("Selenized Dark", "OKSolar Light", r_lines)

output_r <- "./src/01_oksolar.light_guis.R"

writeLines(new_r, output_r)


### Red ----

new_tm <- tm_lines

for (c in ncols) {
  new_tm <- gsub(tb$Selenized_Dark[c],
    tb$OKSolar_Red[c], new_tm,
    ignore.case = TRUE
  )
}

# Rename and output
new_tm <- gsub(
  "dark.selenized_dark",
  "dark.oksolar_red", new_tm
)

new_tm <- gsub("Selenized Dark", "OKSolar Red", new_tm)

output_f <- file.path("dist/tmtheme/OKSolar Red.tmTheme")

writeLines(new_tm, output_f)

# Create also a new R script
input_r <- "./src/selenized/01_selenized.dark_guis.R"
r_lines <- readLines(input_r)
new_r <- gsub("Selenized Dark", "OKSolar Red", r_lines)

output_r <- "./src/01_oksolar.red_guis.R"

writeLines(new_r, output_r)

### Green ----

new_tm <- tm_lines

for (c in ncols) {
  new_tm <- gsub(tb$Selenized_Dark[c],
    tb$OKSolar_Green[c], new_tm,
    ignore.case = TRUE
  )
}

# Rename and output
new_tm <- gsub(
  "dark.selenized_dark",
  "dark.oksolar_green", new_tm
)

new_tm <- gsub("Selenized Dark", "OKSolar Green", new_tm)

output_f <- file.path("dist/tmtheme/OKSolar Green.tmTheme")

writeLines(new_tm, output_f)

# Create also a new R script
input_r <- "./src/selenized/01_selenized.dark_guis.R"
r_lines <- readLines(input_r)
new_r <- gsub("Selenized Dark", "OKSolar Green", r_lines)

output_r <- "./src/01_oksolar.green_guis.R"

writeLines(new_r, output_r)

### Purple ----

new_tm <- tm_lines

for (c in ncols) {
  new_tm <- gsub(tb$Selenized_Dark[c],
    tb$OKSolar_Purple[c], new_tm,
    ignore.case = TRUE
  )
}

# Rename and output
new_tm <- gsub(
  "dark.selenized_dark",
  "dark.oksolar_purple", new_tm
)

new_tm <- gsub("Selenized Dark", "OKSolar Purple", new_tm)

output_f <- file.path("dist/tmtheme/OKSolar Purple.tmTheme")

writeLines(new_tm, output_f)

# Create also a new R script
input_r <- "./src/selenized/01_selenized.dark_guis.R"
r_lines <- readLines(input_r)
new_r <- gsub("Selenized Dark", "OKSolar Purple", r_lines)

output_r <- "./src/01_oksolar.purple_guis.R"

writeLines(new_r, output_r)

### Blue ----

new_tm <- tm_lines

for (c in ncols) {
  new_tm <- gsub(tb$Selenized_Dark[c],
    tb$OKSolar_Blue[c], new_tm,
    ignore.case = TRUE
  )
}

# Rename and output
new_tm <- gsub(
  "dark.selenized_dark",
  "dark.oksolar_blue", new_tm
)

new_tm <- gsub("Selenized Dark", "OKSolar Blue", new_tm)

output_f <- file.path("dist/tmtheme/OKSolar Blue.tmTheme")

writeLines(new_tm, output_f)

# Create also a new R script
input_r <- "./src/selenized/01_selenized.dark_guis.R"
r_lines <- readLines(input_r)
new_r <- gsub("Selenized Dark", "OKSolar Blue", r_lines)

output_r <- "./src/01_oksolar.blue_guis.R"

writeLines(new_r, output_r)

### Sky ----

new_tm <- tm_lines

for (c in ncols) {
  new_tm <- gsub(tb$Selenized_Dark[c],
    tb$OKSolar_Sky[c], new_tm,
    ignore.case = TRUE
  )
}

# Rename and output
new_tm <- gsub(
  "dark.selenized_dark",
  "light.oksolar_sky", new_tm
)
new_tm <- gsub("Selenized Dark", "OKSolar Sky", new_tm)

output_f <- file.path("dist/tmtheme/OKSolar Sky.tmTheme")



writeLines(new_tm, output_f)

# Create also a new R script
r_lines <- readLines(input_r)
new_r <- gsub("Selenized Dark", "OKSolar Sky", r_lines)

output_r <- "./src/01_oksolar.sky_guis.R"

writeLines(new_r, output_r)



# 2. CSS variants ----


## Templates based on selenized.dark -----

css_templates <- list.files("./src/selenized", "css$",
  full.names = TRUE
)

### Dark ----

for (this_template in css_templates) {
  css_lines <- readLines(this_template)
  new_css <- css_lines

  for (c in ncols) {
    new_css <- gsub(tb$Selenized_Dark[c],
      tb$OKSolar_Dark[c], new_css,
      ignore.case = TRUE
    )
  }

  # Rename and output
  new_css <- gsub("selenized.dark", "oksolar.dark", new_css)

  output_f <- gsub("selenized.dark", "oksolar.dark", this_template)
  output_f <- gsub("selenized/", "themes/", output_f)

  writeLines(new_css, output_f)
}

### Light ----

for (this_template in css_templates) {
  css_lines <- readLines(this_template)
  new_css <- css_lines

  for (c in ncols) {
    new_css <- gsub(tb$Selenized_Dark[c],
      tb$OKSolar_Light[c], new_css,
      ignore.case = TRUE
    )
  }

  # Rename and output
  new_css <- gsub("selenized.dark", "oksolar.light", new_css)

  output_f <- gsub("selenized.dark", "oksolar.light", this_template)
  output_f <- gsub("selenized/", "themes/", output_f)

  writeLines(new_css, output_f)
}

### Red ----

for (this_template in css_templates) {
  css_lines <- readLines(this_template)
  new_css <- css_lines

  for (c in ncols) {
    new_css <- gsub(tb$Selenized_Dark[c],
      tb$OKSolar_Red[c], new_css,
      ignore.case = TRUE
    )
  }

  # Rename and output
  new_css <- gsub("selenized.dark", "oksolar.red", new_css)

  output_f <- gsub("selenized.dark", "oksolar.red", this_template)
  output_f <- gsub("selenized/", "themes/", output_f)

  writeLines(new_css, output_f)
}

### Green ----

for (this_template in css_templates) {
  css_lines <- readLines(this_template)
  new_css <- css_lines

  for (c in ncols) {
    new_css <- gsub(tb$Selenized_Dark[c],
      tb$OKSolar_Green[c], new_css,
      ignore.case = TRUE
    )
  }

  # Rename and output
  new_css <- gsub("selenized.dark", "oksolar.green", new_css)

  output_f <- gsub("selenized.dark", "oksolar.green", this_template)
  output_f <- gsub("selenized/", "themes/", output_f)

  writeLines(new_css, output_f)
}

### Purple ----

for (this_template in css_templates) {
  css_lines <- readLines(this_template)
  new_css <- css_lines

  for (c in ncols) {
    new_css <- gsub(tb$Selenized_Dark[c],
      tb$OKSolar_Purple[c], new_css,
      ignore.case = TRUE
    )
  }

  # Rename and output
  new_css <- gsub("selenized.dark", "oksolar.purple", new_css)

  output_f <- gsub("selenized.dark", "oksolar.purple", this_template)
  output_f <- gsub("selenized/", "themes/", output_f)

  writeLines(new_css, output_f)
}

### Blue ----

for (this_template in css_templates) {
  css_lines <- readLines(this_template)
  new_css <- css_lines

  for (c in ncols) {
    new_css <- gsub(tb$Selenized_Dark[c],
      tb$OKSolar_Blue[c], new_css,
      ignore.case = TRUE
    )
  }

  # Rename and output
  new_css <- gsub("selenized.dark", "oksolar.blue", new_css)

  output_f <- gsub("selenized.dark", "oksolar.blue", this_template)
  output_f <- gsub("selenized/", "themes/", output_f)

  writeLines(new_css, output_f)
}

### Sky ----

for (this_template in css_templates) {
  css_lines <- readLines(this_template)
  new_css <- css_lines

  for (c in ncols) {
    new_css <- gsub(tb$Selenized_Dark[c],
      tb$OKSolar_Sky[c], new_css,
      ignore.case = TRUE
    )
  }

  # Rename and output
  new_css <- gsub("selenized.dark", "oksolar.sky", new_css)

  output_f <- gsub("selenized.dark", "oksolar.sky", this_template)
  output_f <- gsub("selenized/", "themes/", output_f)

  writeLines(new_css, output_f)
}

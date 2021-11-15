library(readxl)
library(Rraven)
xls <- list.files(path = "./data/raw/avisoft_2_raven_annotations/", full.names = TRUE, pattern = "\\.xlsx$")

for (i in xls)
{
  xl <- read_excel(i)
  
  xl$sound.files <- gsub(" |_","", (strsplit(toupper(gsub(".xlsx", "", basename(i))), "_AUDIO")[[1]][2]))
  print(i)
  
  xl$selec <- 1:nrow(xl)
  xl$channel <- 1
  
  if (is.character(xl$start)) {
    xl$start <- gsub(",", ".", xl$start)
  xl$start <- as.numeric(xl$start)
  xl <- xl[!is.na(xl$start), ]
  }
    
  if (is.character(xl$end)){
    xl$end <- gsub(",", ".", xl$end)
  xl$end <- as.numeric(xl$end)
  xl <- xl[!is.na(xl$end), ]
  }
  
  
  exp_raven(X = xl, path = "./data/raw/avisoft_2_raven_annotations/", file.name = gsub(".xlsx", "", basename(i)))  

}

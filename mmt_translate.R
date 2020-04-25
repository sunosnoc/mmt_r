# This function uses the ModernMT machine translation service API to translate a given character vector
# x = character vector; key = authentification key; source = source language, target = target language
mmt_translate <- function(x, key, source, target){
  if(!require("httr")) {library("httr")}
  if(!require("jsonlite")) {library("jsonlite")}
  if(!require("stringr")) {library("stringr")}
  x_translated <- vector(length = length(x))
  for(i in 1:length(x_translated)){
    translation <- GET("https://api.modernmt.eu/translate", add_headers('MMT-ApiKey' = key), query=list(source=source, target=target, q=x[i]))
    x_translated[i] <- str_match(rawToChar(translation$content), '\"translation\":\"(.*?)\",\"characters\"')[2][1]
  }
  rm(translation)
  return(x_translated)
}

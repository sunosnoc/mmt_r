# This function uses the ModernMT machine translation service API to translate a given character vector
# x = character vector; key = authentification key; source = source language, target = target language
mmt_context <- function(x, key, source, target){
  if(!require("httr")) {library("httr")}
  if(!require("jsonlite")) {library("jsonlite")}
  if(!require("stringr")) {library("stringr")}
  if(!require("tokenizers")) {library("tokenizers")}
      context <- GET("https://api.modernmt.eu/context-vector", add_headers('MMT-ApiKey' = key), query=list(source=source, targets=target, text=x))
  return(context)
}
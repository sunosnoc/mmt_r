# This function uses the ModernMT machine translation service API to translate a given character vector
# x = character vector; key = authentification key; source = source language, target = target language
mmt_translate_sentences <- function(x, key, source, target, context){
  if(!require("httr")) {library("httr")}
  if(!require("jsonlite")) {library("jsonlite")}
  if(!require("stringr")) {library("stringr")}
  if(!require("tokenizers")) {library("tokenizers")}
  sentences <- unlist(tokenize_sentence(mgsub(x, c("\\|", "<", ">"), c(" ", " ", " "))))
  translation <- vector(length = length(sentences))
  for(s in 1:length(sentences)){
    transl <- GET("https://api.modernmt.eu/translate", add_headers('MMT-ApiKey' = key), query=list(source=source, 
      target=target, q=sentences[s], context=paste(sentences[1:4], collapse = " ")))
    translation[s] <- str_match(rawToChar(transl$content), '\"translation\":\"(.*?)\",\"characters\"')[2][1]
  }
  x_translated <- paste(translation, collapse= " ")
  rm(translation)
  return(x_translated)
}



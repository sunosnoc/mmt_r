# mmt_translate_Sentences - A simple function to use the ModernMT translation API in R
## Description
ModernMT is a machine translation service, which provides document-level context-awareness.
The function provided here is a simple way to integrate this service into any NLP routine in R.
It requires a registered modernMT account and a user key.
The function issues one request for each sentence of a given input character vector and uses the first four sentences as a context vector.

## Use
Parameters:
* x = character vector containing individual texts
* key = mmt user key 
* source = 2 digit code for source language
* target = 2 digit code for target language

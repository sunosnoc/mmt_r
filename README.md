# mmt_r - A simple function to use the ModernMT translation API in R
## Description
ModernMT is a machine translation service, which provides document-level context-awareness.
The function provided here is a simple way to integrate this service into any NLP routine in R.
It requires a registered modernMT account and a user key.
## Use
Parameters:
* x = character vector containing individual texts
* key = mmt user key 
* source = 2 digit code for source language
* target = 2 digit code for target language

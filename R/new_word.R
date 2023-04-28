# function create a word doc here
create_word <- function() {
  header <-
  '---
title: " "
author: " "
date:"`r Sys.Date()`"
output:
  word_document:
    reference_docx:"eSAP_Template_v2.1_BWE.docx"
---'
  rstudioapi::documentNew(header, type = "rmarkdown")
}



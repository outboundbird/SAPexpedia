# function create a word doc here
create_word <- function() {

  header <-
  glue::glue('---
title: "$"
author: " "
date:"{Sys.Date()}"
output:
  word_document:
    reference_docx: "eSAP_Template_v2.1_BWE.docx"
---')
  rstudioapi::documentNew(header, type = "rmd")
}

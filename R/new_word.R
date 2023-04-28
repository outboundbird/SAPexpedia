#' create Rmd file to generate Word document.
#' create yaml header for rmd to output word document
#' @return rmd document
#' @export
create_word <- function() {

  header <-
  glue::glue('---
title: "$"
author: " "
date: "{Sys.Date()}"
output:
  word_document:
    reference_docx: "eSAP_Template_v2.1_BWE.docx"
---')
  rstudioapi::documentNew(header, type = "rmarkdown")
}

# ask what to insert
# search in the md files
# insert at the cursor position

library(miniUI)
library(rstudioapi)
library(shiny)



#' Insert the paragraph of SAP topic. One topic at a time.
#' Rstudio Addin
#'
#' @return Paragraph of the SAP topic
#' @export
#' # ADD_EXAMPLES_HERE
insert <- function() {
    ui <- miniPage(
        gadgetTitleBar("My Gadget"),
        miniContentPanel(
            shiny::selectizeInput(
                "topic", "Topic",
                c(
                    "Descriptive" = "desc",
                    "DEA" = "dea",
                    "GSEA" = "gsea",
                    "GWAS" = "gwas",
                    "HLAseq" = "hla-seq",
                    "Clustering" = "clust",
                    "Multiplicity" = "mult",
                    "Olink" = "olink",
                    "Pscan" = "pscan",
                    "RNAseq preprocess" = "rna-seq_preprocess",
                    "scRNAseq preprocess" = "scRNA_preprocess"
                ),
                multiple = FALSE
            )
        )
    )

    server <- function(input, output, session) {

        ## Your reactive logic goes here.
        shiny::observeEvent(input$topic, {
            refdoc <- paste0(input$topic, ".md")
            content <- readLines(file.path("template", refdoc))
            content_line <- paste(content, collapse = "\\n")
            doc <- rstudioapi::getActiveDocumentContext()
            cursor_pos <- rstudioapi::primary_selection(doc)
            insert_pos <- c(cursor_pos$range$start[1], 1)
            rstudioapi::insertText(insert_pos, text = content_line)
        })


        # Listen for the 'done' event. This event will be fired when a user
        # is finished interacting with your application, and clicks the 'done'
        # button.
        shiny::observeEvent(input$done, {

            # Here is where your Shiny application might now go an affect the
            # contents of a document open in RStudio, using the `rstudioapi` package.
            #
            # At the end, your application should call 'stopApp()' here, to ensure that
            # the gadget is closed after 'done' is clicked.
            shiny::stopApp()
        })
    }
    viewer <- shiny::dialogViewer("SAP topic", 300)
    shiny::runGadget(ui, server, viewer = viewer)
}

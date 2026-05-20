## Test different formats
#xlsx_file <- "https://uofi.box.com/shared/static/5n7h5ezxmqsi50rsuiwpg1psirfgxiak.xlsx"

#json_file <- "https://uofi.box.com/shared/static/orobzq8usreytbmz1zilqs0jyibi98is.csv"

#csv_file <- "https://uofi.box.com/shared/static/zr0vwsufj9eidkr3zthhgaoe45jvhu4g.csv"
library(shiny)
library(DT)
library(tidyverse)
library(jsonlite)
library(openxlsx)

ui <- fluidPage(
  titlePanel("Load Data from URL"),
  
  sidebarLayout(
    sidebarPanel(
      
      textInput(
        "url",
        "Enter data URL:",
        placeholder = "https://example.com/data.csv"
      ),
      
      # File type selector
      selectInput(
        "file_type",
        "Select file type:",
        choices = c(
          "Delimited Text" = "delim",
          "Excel (.xlsx)" = "xlsx",
          "JSON" = "json"
        )
      ),
      
      # Delimiter options (only shown for delimited text)
      conditionalPanel(
        condition = "input.file_type == 'delim'",
        
        selectInput(
          "delimiter",
          "Delimiter:",
          choices = c(
            "Comma (,)" = ",",
            "Tab (\\t)" = "\t",
            "Semicolon (;)" = ";"
          )
        )
      ),
      
      actionButton("load", "Load Data")
    ),
    
    mainPanel(
      DTOutput("table")
    )
  )
)

server <- function(input, output, session) {
  
  # Validate dataframe
  is_valid_df <- function(x) {
    is.data.frame(x) && ncol(x) > 0
  }
  
  load_data <- function(url, type, delim = NULL) {
    
    fail <- function(msg) {
      data.frame(Message = msg)
    }
    
    res <- try({
      
      if (type == "delim") {
        
        read_delim(
          file = url,
          delim = delim,
          show_col_types = FALSE
        )
        
      } else if (type == "xlsx") {
        
        read.xlsx(url)
        
      } else if (type == "json") {
        
        as.data.frame(fromJSON(url))
      }
      
    }, silent = TRUE)
    
    if (!inherits(res, "try-error") && is_valid_df(res)) {
      return(res)
    }
    
    fail("Could not load the file.")
  }
  
  data <- eventReactive(input$load, {
    
    req(input$url)
    
    load_data(
      url = input$url,
      type = input$file_type,
      delim = input$delimiter
    )
  })
  
  output$table <- renderDT({
    datatable(data())
  })
}

shinyApp(ui, server)
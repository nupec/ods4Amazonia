#' meta9 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_meta9_ui <- function(id){
  ns <- NS(id)
  tagList(
    h1("Meta 9"),
  #  mod_filtro_ui(ns("filtro_ui_1"))

  )
}

#' meta9 Server Functions
#'
#' @noRd
mod_meta9_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_meta9_ui("meta9_1")

## To be copied in the server
# mod_meta9_server("meta9_1")

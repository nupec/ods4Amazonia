#' meta3 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_meta3_ui <- function(id){
  ns <- NS(id)
  tagList(
    h1("Meta 3"),
    # mod_filtro_ui(ns("filtro_ui_1"))

  )
}

#' meta3 Server Functions
#'
#' @noRd
mod_meta3_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_meta3_ui("meta3_1")

## To be copied in the server
# mod_meta3_server("meta3_1")

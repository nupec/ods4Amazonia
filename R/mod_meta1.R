#' meta1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_meta1_ui <- function(id){
  ns <- NS(id)
  tagList(
    h1("Meta 1"),
    fluidRow(
      bs4Dash::bs4Card(
        title = "Filtros",
        width = 12,
        fluidRow(
          bs4Dash::bs4Card(
          column(
            width = 12,
            selectInput(
              inputId = ns("estado"),
              label = "Selecione o estado",
              choices = unique(sort(Meta1$nome_uf))
              )
            )),
          bs4Dash::bs4Card(
          column(
            width = 12,
            selectInput(
              inputId = ns("municipio"),
              label = "Selecione o município",
              choices =  c("Carregando..." = "")
            )
          )
          )
        )
        )
      ),
# ui da tabela --------------------------------------------------------------------------------
    fluidRow(
      column(
        width = 12,
        reactable::reactableOutput(ns("tabMeta1"))
      )
    )
  )

}

#' meta1 Server Functions
#'
#' @noRd
  mod_meta1_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

# "OBSERVE", necessário para a reatividade do filtro MUNICIPIO --------------------------------

    req(Meta1$nome_municipio)
    observe({
      opcoes <- Meta1 |>
        dplyr::filter(Meta1$nome_uf == input$estado) |>
        dplyr::pull(nome_municipio) |>
        unique()

      updateSelectInput(
        inputId = "municipio",
        choices = opcoes
      )
    })

# outputs: Aqui uma tabela --------------------------------------------------------------------
    output$tabMeta1 <- reactable::renderReactable({

      Meta1 |>
        dplyr::filter(
          nome_uf        == input$estado,
          nome_municipio == input$municipio) |>
        dplyr::select(ano, indice1b, indice1a) |>
        reactable::reactable(
          striped = TRUE,
          searchable = TRUE,
          filterable = TRUE,
          bordered = TRUE,
          highlight = TRUE,
          theme = reactable::reactableTheme(
          stripedColor ="#BDB76B"
          )
        )


    })

  })
}

## To be copied in the UI
# mod_meta1_ui("meta1_1")

## To be copied in the server
# mod_meta1_server("meta1_1")

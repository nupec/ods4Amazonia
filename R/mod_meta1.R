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
    hr(),
    fluidRow(
        bs4Dash::bs4Card(
        title = "Filtros",
        width = 12,
        fluidRow(
          column(
            width = 6,
            selectInput(
              inputId = ns("estado"),
              label = "Selecione o estado",
              choices = unique(sort(Meta1$nome_uf)),
              width = "90%"
              )
            ),
          column(
            width = 6,
            selectInput(
              inputId = ns("municipio"),
              label = "Selecione o município",
              choices =  c("Carregando..." = ""),
              width = "90%"
            )
          )
        )  
      )
  ), 
# ui da tabela --------------------------------------------------------------------------------
    fluidRow(
      column(
        width = 6,
        reactable::reactableOutput(ns("tabMeta1"))
        ),
        column(
          width = 6,
          echarts4r::echarts4rOutput(ns("grafMeta1"))  
        )

# ui gráficos ---------------------------------------------------------------------------------
      # column(
      # width = 6,
      # leaflet::leafletOutput(ns("mapaIndice1b"))
      # )
    ),



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

# outputs: ATabela Meta 1 --------------------------------------------------------------------
    output$tabMeta1 <- reactable::renderReactable({

     Meta1 |>
        dplyr::filter(
          nome_uf        == input$estado,
          nome_municipio == input$municipio) |>
        dplyr::select(ano, indice1b, indice1a) |>
        reactable::reactable(
          striped = TRUE,
     #     searchable = TRUE,
       #   filterable = TRUE,
          bordered = TRUE,
          highlight = TRUE,
          theme = reactable::reactableTheme(
          stripedColor ="#BDB76B"
          ),
        )
    })
    
# output: Gráficos Meta 1 ---------------------------------------------------------------------

    # output$mapaIndice1b <- plotly::renderPlotly({
    #   
    #   graf1b <- Meta1 |> 
    #     dplyr::filter(nome_municipio == input$municipio) |> 
    #     ggplot2::ggplot(ggplot2::aes(x=ano, y=indice1b)) +
    #     ggplot2::geom_line() +
    #     ggplot2::theme_minimal()
    #     
    #   plotly::ggplotly(graf1b)
    #   
    # })
    
    output$grafMeta1 <- echarts4r::renderEcharts4r({
      
      Meta1 |> 
        dplyr::filter(nome_uf == input$estado,
                      nome_municipio == input$municipio) |> 
        echarts4r::e_charts(x = ano) |> 
        echarts4r::e_line(serie = indice1b) |> 
        echarts4r::e_line(serie = indice1a)
      
    })
  })
}

## To be copied in the UI
# mod_meta1_ui("meta1_1")

## To be copied in the server
# mod_meta1_server("meta1_1")

#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic

    bs4Dash::bs4DashPage(
      bs4Dash::bs4DashNavbar(),
      bs4Dash::bs4DashSidebar(
# Menu lateral -------------------------------------------------------------------------------
        bs4Dash::bs4SidebarMenu(
          bs4Dash::bs4SidebarMenuItem(
            "Meta 1",
            tabName = "tabname1",
            icon = icon("table")
          ),
          bs4Dash::bs4SidebarMenuItem(
            "Meta 2",
            tabName = "tabname2",
            icon = icon("line-chart")
          ),
          bs4Dash::bs4SidebarMenuItem(
            "Meta 3",
            tabName = "tabname3",
            icon = icon("line-chart")
          ),
          bs4Dash::bs4SidebarMenuItem(
            "Meta 4",
            tabName = "tabname4",
            icon = icon("line-chart")
          ),
          bs4Dash::bs4SidebarMenuItem(
            "Meta 5",
            tabName = "tabname5",
            icon = icon("line-chart")
          ),
          bs4Dash::bs4SidebarMenuItem(
            "Meta 6",
            tabName = "tabname6",
            icon = icon("line-chart")
          ),
          bs4Dash::bs4SidebarMenuItem(
            "Meta 7",
            tabName = "tabname7",
            icon = icon("line-chart")
          ),
          bs4Dash::bs4SidebarMenuItem(
            "Meta 8",
            tabName = "tabname8",
            icon = icon("line-chart")
          ),
          bs4Dash::bs4SidebarMenuItem(
            "Meta 9",
            tabName = "tabname9",
            icon = icon("line-chart")
          ),
          bs4Dash::bs4SidebarMenuItem(
            "Meta 10",
            tabName = "tabname10",
            icon = icon("line-chart")
          )
        )
      ),

# Corpo do painel -----------------------------------------------------------------------------
      bs4Dash::bs4DashBody(
        bs4Dash::bs4TabItems(
          bs4Dash::bs4TabItem(
            tabName = "tabname1",
            mod_meta1_ui("meta1_1")
            ),
          bs4Dash::bs4TabItem(
            tabName = "tabname2",
            mod_meta2_ui("meta2_1")
          ),
          bs4Dash::bs4TabItem(
            tabName = "tabname3",
            mod_meta3_ui("meta3_1")
          ),
          bs4Dash::bs4TabItem(
            tabName = "tabname4",
            mod_meta4_ui("meta4_1")
          ),
          bs4Dash::bs4TabItem(
            tabName = "tabname5",
            mod_meta5_ui("meta5_1")
          ),
           bs4Dash::bs4TabItem(
            tabName = "tabname6",
            mod_meta6_ui("meta6_1")
          ),
          bs4Dash::bs4TabItem(
            tabName = "tabname7",
            mod_meta7_ui("meta7_1")
          ),
          bs4Dash::bs4TabItem(
            tabName = "tabname8",
            mod_meta8_ui("meta8_1")
          ),
         bs4Dash::bs4TabItem(
          tabName = "tabname9",
          mod_meta9_ui("meta9_1")
         ),
         bs4Dash::bs4TabItem(
           tabName = "tabname10",
           mod_meta10_ui("meta10_1")
         )
        )
      )
    )
  )

}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "ods4Amazonia"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

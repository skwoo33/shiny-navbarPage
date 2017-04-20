library(shiny)
library(shinythemes)

shinyUI(navbarPage("Default", theme = shinytheme("cerulean"),
  tabPanel("Navbar 1",
    sidebarPanel(
      fileInput("file", "File input:"),
      textInput("text", "Text input:", "general"),
      sliderInput("slider", "Slider input:", min = 1, max = 100, value = 30),
      p("Default actionButton:"),
      actionButton("action", "Search"),
      p("actionButton with CSS class:"),
      actionButton("action2", "Action button", class = "btn-primary")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Tab1",
          h4("Table"),
          tableOutput("tableOut"),
          h4("Verbatim text output"),
          verbatimTextOutput("verbatimOut"),
          h1("Header1"),
          h2("Header2"),
          h3("Header3"),
          h4("Header4"),
          h5("Header5")
        ),
        tabPanel("Tab2"
        ),
        tabPanel("Tab3"
        )
      )
    )
           ),
  tabPanel("Plot"
           ),
  tabPanel("Table"
           )
))

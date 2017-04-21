shinyApp(
  ui = 
    # tagList(
      navbarPage(
        # Argument	Description
        # header	Tag or list of tags to display as a common header above all tabPanels.
        # footer	Tag or list of tags to display as a common footer below all tabPanels
        # inverse	TRUE to use a dark background and light text for the navigation bar
        # collapsable	TRUE to automatically collapse the navigation elements into a menu when the width of the browser is less than 940 pixels (useful for viewing on smaller touchscreen device)
        shinythemes::themeSelector(),
        header = tagList(
          "Header",
          textInput("textH", "Text input:")
        ),
        footer = "Footer",
        inverse = TRUE,
        collapsable = TRUE,
        # theme = "cerulean",  # <--- To use a theme, uncomment this
        "shinythemes",
        tabPanel("Navbar 1",
                 sidebarPanel(
                   fileInput("file", "File input:"),
                   textInput("txt", "Text input:", "general"),
                   sliderInput("slider", "Slider input:", 1, 100, 30),
                   tags$h5("Deafult actionButton:"),
                   actionButton("action", "Search"),
                   
                   tags$h5("actionButton with CSS class:"),
                   actionButton("action2", "Action button", class = "btn-primary")
                 ),
                 mainPanel(
                   tabsetPanel(
                     tabPanel("Tab 1",
                              h4("Table"),
                              tableOutput("table"),
                              h4("Verbatim text output"),
                              verbatimTextOutput("txtout"),
                              h1("Header 1"),
                              h2("Header 2"),
                              h3("Header 3"),
                              h4("Header 4"),
                              h5("Header 5")
                     ),
                     tabPanel("Tab 2"),
                     tabPanel("Tab 3")
                   )
                 )
        ),
        tabPanel("Navbar 2"),
        tabPanel("Navbar 3"),
        # Sub Menu
        navbarMenu("More",
          tabPanel("Sub-Componet A",
            h4("This is sub-component A"),
            textInput("textSubA", "Text input:")
          ),
          "----",
          tabPanel("Sub-Componet B",
            h4("This is sub-component B"),
            numericInput("numericSubA", "Numeric input:", value = 10)
          )
        )
      )
    # )
  ,
  server = function(input, output) {
    output$txtout <- renderText({
      paste(input$txt, input$slider, format(input$date), sep = ", ")
    })
    output$table <- renderTable({
      head(cars, 4)
    })
  }
)

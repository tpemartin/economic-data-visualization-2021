library(shiny)
library(rclipboard)
ui <- fluidPage(
  rclipboardSetup(),
  # Application title
  titlePanel("GG Dash, by NTPU Economics Department"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      shiny::numericInput("size_text","size_text", 12),
      shiny::numericInput("imgheight", "height", value=400),
      shiny::numericInput("imgwidth", "width", value=400),
      uiOutput("clip")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("ggexperiment"),
      shiny::textOutput("text")
    )
  )
)

server <- function(input, output) {
  library(ggplot2)
  
  .plotScript <- 'size=input$size_text
ggplot(data=data4plot,
)+
geom_point(
mapping=aes(
x=x,y=y
),
fill="#2fc1d3",
shape=21,
color="black",
stroke=1,
size=12
)+
geom_text(
#data=data4plot$text$data,
mapping=aes(
x=x,y=y,label=label
),
hjust=0,
size=size/.pt
)'
  generate_copyText <- function(serverText, ...){
    inputs <- list(...)
    patterns <- paste0("input\\$", names(inputs))
    replacements <- create_replacementText(inputs)
    names(replacements) <- patterns
    serverText2 <- stringr::str_remove_all(
      serverText, "#input\\$.+(?=\\\\\\n)"
    )
    stringr::str_replace_all(
      serverText2, replacements
    )
  }
  create_replacementText <- function(inputs){
    purrr::map_chr(
      inputs,
      ~{
        if(is.character(.x)){
          paste0('"', .x, '"')
        } else {
          as.character(.x)
        }
      })
  }
  output$ggexperiment <- renderPlot({
    size=input$size_text
    ggplot(data=.GlobalEnv$data4plot)+
      geom_point(
        mapping=aes(
          x=x,y=y
        ),
        fill="#2fc1d3",
        shape=21,
        color="black",
        stroke=1,
        size=12
      )+
      geom_text(
        mapping=aes(
          x=x,y=y,label=label
        ),
        hjust=0,
        size=size/.pt
      )
  })
  updatedPlotScript <- reactive({
    generate_copyText(.plotScript,
      size_text = input$size_text)
  })
  output$text <- renderText({
    updatedPlotScript()
  })
  output$clip <- renderUI({
    rclipboard::rclipButton("clipbtn", "Copy",
      updatedPlotScript(),
      icon("clipboard"))
  })
  
}
shiny::shinyApp(ui=ui, server=server)
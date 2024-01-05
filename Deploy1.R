library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Scatter plot of mtcars"),
  sidebarLayout(
    sidebarPanel(
      selectInput("x", "X-axis variable:",
                  choices = names(mtcars)),
      selectInput("y", "Y-axis variable:",
                  choices = names(mtcars))
    ),
    mainPanel(
      plotOutput("scatterPlot")
    )
  )
)

server <- function(input, output) {
  output$scatterPlot <- renderPlot({
    ggplot(mtcars, aes_string(x = input$x, y = input$y)) +
      geom_point()
  })
}

shinyApp(ui = ui, server = server)

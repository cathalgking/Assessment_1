#MA5111
#Assessment 1
#Cathal King
#App 1

library(shiny)

#Define UI for application
ui <- fluidPage(
  
  #Application title
  headerPanel('Normal Probability Distribution'),
  
  sidebarPanel(
    numericInput('N', 'Number of Trials', min = 0, max = 50, value = 25),
    
    sliderInput('M', 'Mean', min = 1, max = 100, value = 50),

    sliderInput('SD', 'Standard Deviation',
                min = 1, max = 100, value = 50),

    checkboxInput('Normal', 'Overlay Normal Distribution', TRUE)), 

    mainPanel(
      plotOutput(outputId = "hist")
      )
    
  )
  
  
server <- function(input,output){
  
  output$hist <- renderPlot({
    hist(rnorm(input$N)) 
  })
}

shinyApp(ui = ui, server = server)
#MA5111 Assessment 1 - R/Shiny&Github
#Cathal King
#App2

library(shiny)

ui <- fluidPage(
  
  titlePanel('Test 1'),
  
  sidebarLayout(
    sidebarPanel(
      fileInput('datafile','Choose CSV file', accept = c("text/csv",
                                                         "text/comma-separated-values,text/plain",
                                                         ".csv")),
      selectInput('var', 'variable:', c('Age' = 'age','Weight' = 'weight','Height' = 'height','bmi' = 'bmi')),
      radioButtons('rb', 'Choose a colour:', c('Red' = 'red', 'Blue' = 'blue', 'Green' = 'green', 'Orange' = 'orange'))
      
                ),
    mainPanel(
      tableOutput('contents'),
      plotOutput('box')
    )
      
  )
)


server <- function(input, output){
  
  output$contents <- renderTable({
    req(input$datafile)
    infile <- input$datafile
    read.csv(infile$datapath, sep = ',', header = 1)
  })
  
  output$box <- renderPlot({
    req(input$datafile)
    infile <- input$datafile
    data<-read.csv(infile$datapath, sep = ',', header = 1)
    var <- input$var
    col <- input$rb
    boxplot(data[,var], col=col, main = paste('Selected variable'))
  })
  
}


shinyApp(ui = ui, server = server)

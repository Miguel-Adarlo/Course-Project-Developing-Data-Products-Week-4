#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

data(iris)
# Define server logic required to draw a histogram
function(input, output, session) {

    output$scatterPlot <- renderPlot({
 
      irisPlot <- ggplot(data = iris, aes(x = get(input$xFactor), y = get(input$yFactor), color = Species)) +
        geom_point() +
        labs( x = input$xFactor, y=input$yFactor)
        
      if(input$show_line){
        irisPlot <- irisPlot + geom_smooth(method = lm, formula=y~x)
      }
        
      plot(irisPlot)

    })

}

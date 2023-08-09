#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Libraries used:
library(shiny)
library(ggplot2)

# Load mtcars data:
data(iris)
# Define UI 
fluidPage(

    # Application title
    titlePanel("Iris Dataset: Pick variables to plot"),

    # Sidebar with radio buttons to show which variables to plot on scatterplot
    sidebarLayout(
        sidebarPanel(
            radioButtons("xFactor", "Choose which variable to plot on the x-axis: ",
                         choices=c("Sepal.Length", "Sepal.Width", "Petal.Length", 
                                   "Petal.Width")),
            radioButtons("yFactor", "Choose which variable to plot on the y-axis: ",
                         choices=c("Sepal.Length", "Sepal.Width", "Petal.Length", 
                                   "Petal.Width")),
            checkboxInput("show_line", "Show/Hide Regression Line", value = TRUE),
            submitButton("Create Plot")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("scatterPlot")
        )
    ),
    
    h2("Instructions:"),
    p("This site plots two variables from the iris dataset together. The colors represent the species of the flowers.
      A regression line is included with the graph, and it can be turned off with the checkbox."),
    p("You must click the Create Plot button for the plot to update.")
)

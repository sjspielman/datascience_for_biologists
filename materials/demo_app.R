#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
theme_set(theme_minimal())


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Sepal Length Histogram"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            
            ## Content in the sidebarPanel
            sliderInput("user_bins",             ### The value will be stored in input$user_bins
                        "Number of bins:",  ### Text prompt for user
                        min = 1,            ### Minimum value allowed from user
                        max = 50,           ### Maximum value allowed from user
                        value = 30)         ### Default value
        ), # HAS A COMMA since next code line is a function

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot") # DOES NOT HAVE A COMMA since next code line is )  <- closing paranthesis
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    
    output$distPlot <- renderPlot({
        ggplot(iris, aes(x = Sepal.Length)) + 
            geom_histogram(bins = input$user_bins, ## Aha!!!! 
                           fill = "goldenrod", 
                           color = "dodgerblue") + 
            labs(x = "Sepal Length (cm)", y = "Count")
    })
}







# Run the application 
shinyApp(ui = ui, server = server)

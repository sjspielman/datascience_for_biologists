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
      sliderInput("user_bins",        ### The value will be stored in input$user_bins
                  "Number of bins:",  ### Text prompt for user
                  min = 1,            ### Minimum value allowed from user
                  max = 50,           ### Maximum value allowed from user
                  value = 30),         ### Default value
      
      ### input$which_species
      selectInput("which_species", 
                  "Which species would you like to view in FIRST PLOT?", 
                  choices = c("setosa", 
                              "virginica" ,
                              "versicolor", 
                              "All"), 
                  selected = "setosa"), # closes selectInput
      radioButtons("make_it_facet", 
                   "Should we facet SECOND PLOT by species?",
                   choices = c("No", "Yes"), selected = "No") ## closes radioButtons
    ), # closes sidebarPanel
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("big text for ploots!"),
      plotOutput("firstPlot"), 
      br(), 
      br(),
      h4("slightly smaller text for ploots!"),
      plotOutput("secondPlot", height = "300px")
    ) ## mainpanel close
  ) # sidebarLayout
) ## CLOSES FLUIDPAGE

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  ## NOT ALLOWED TO HAVE REGULAR R CODE
  #subset_iris <- filter(iris, Species == input$which_species)
  
  ## REACTIVE CONSTRUCTS. use as subset_iris()
  subset_iris <- reactive({
    if (input$which_species == "All") {
      iris
    } else{
      iris %>%
        filter(Species == input$which_species)
    }
  })
  
  output$firstPlot <- renderPlot({
    subset_iris() %>%  ## use the reactive variable
      ggplot(aes(x = Sepal.Length)) + 
      geom_histogram(bins = input$user_bins, ## Aha!!!! 
                     fill = "goldenrod", 
                     color = "dodgerblue") + 
      labs(x = "Sepal Length (cm)", y = "Count", title = input$which_species)
  })
  
  
  output$secondPlot <- renderPlot({
    iris %>%  ## use the reactive variable
      ggplot(aes(x = Petal.Length)) + 
      geom_histogram(bins = input$user_bins, ## Aha!!!! 
                     fill = "maroon", 
                     alpha = 0.4,
                     color = "firebrick") + 
      labs(x = "Sepal Length (cm)", y = "Count") -> second_hist
    
    if (input$make_it_facet == "Yes"){
      second_hist <- second_hist + facet_wrap(~Species)
    }
    ## return it back
    second_hist
  })
}







# Run the application 
shinyApp(ui = ui, server = server)

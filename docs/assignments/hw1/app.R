library(shiny)
library(shinythemes)
library(DT)
library(readr)
library(dplyr)
set.seed(11)
readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-07/coffee_ratings.csv') %>%
    dplyr::filter(category_two_defects > 0) %>%
    dplyr::select(total_cup_points,
                  species,
                  variety,
                  country_of_origin,
                  region,
                  farm_name,
                  number_of_bags,
                  number_of_defects = category_two_defects,
                  aroma,
                  flavor,
                  acidity,
                  balance,
                  sweetness,
                  moisture) %>%
    group_by(species) %>%
    sample_n(10) %>% 
    ungroup() -> coffee_ratings 


coffee_ratings <- coffee_ratings[sample(20),]

# Thanks, stackoverflow!
# https://stackoverflow.com/questions/58526047/customizing-how-datatables-displays-missing-values-in-shiny
rowCallback <- c(
    "function(row, data){",
    "  for(var i=0; i<data.length; i++){",
    "    if(data[i] === null){",
    "      $('td:eq('+i+')', row).html('NA')",
    "        .css({'color': 'rgb(151,151,151)', 'font-style': 'italic'});",
    "    }",
    "  }",
    "}"  
)

ui <- fluidPage(theme = shinytheme("journal"),
    titlePanel("Assignment #1: Data types and figure types."),
    h4("Answers due to Canvas as a separate PDF file by Tuesday 2/2/21 at 1:00 PM."),
    br(),
    p("This dataset, called", tags$code("coffee_ratings"),"has been subsetted (to only 30 rows and 14 columns) from the full dataset", 
      a("here.", href = "https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-07-07/readme.md"),
      "The dataset provides ratings of different coffee beans made around the world. Each row is a single coffee bean, and each column provides different information about that coffee bean including its total rating (`total_cup_score`, on a scale of 100), what species and variety of coffee it is, information about where the coffee comes from, information about the number of defects detected per coffee, and different graded measurements, on a scale of 10, for various coffee attributes (like aroma or sweetness)."),
    br(),br(),
    div(style = "width:75%;font-size:80%;",
    DTOutput("coffee")),
    br(),
    includeMarkdown("questions.md")
)

server <- function(input, output) {
    output$coffee <- renderDT({
        datatable(coffee_ratings, rownames = FALSE,
                  options = list(rowCallback = JS(rowCallback))
                  )
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

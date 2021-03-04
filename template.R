## R Shiny Template
## 02.05.21
## Piers Kirk, pfk3jd
## Note: when the app is finalized, create
## new file inside sub-directory of wd and
## save as app.R

## the following line allows me to call functions created in functions_to_create_hists.R 
source("/Users/pierskirk/Desktop/Spring2020/NessRA/Spring2021/NesselroadeSTATSwikiShinyApps/functions_to_create_hists.R")

## stopped at minute 33:16 of shiny apps tutorial
library(shiny)

ui <- fluidPage(
  # App title ----
  titlePanel("The Central Limit Theorem"),
  
  selectInput(
    "distribution",
    "Distribution:",
    
    c(
      "Bernoulli" = "Bernoulli",
      "Bimodal" = "Bimodal",
      "Binomial" = "Binomial",
      "Chi-Square" = "Chi-Square",
      "F" = "F",
      "Logistic" = "Logistic",
      "Normal Distribution (Gaussian)" = "Normal Distribution (Gaussian)",
      "Poisson" = "Poisson",
      "Student t" = "Student t",
      "Uniform" = "Uniform"
    )
  ), 
  
  # Sidebar to demonstrate various slider options ----
  sidebarPanel(
    # Input: Number of Samples ----
    sliderInput(
      inputId = "num_of_samples",
      label = "Number of Samples",
      min = 1,
      max = 10000,
      value = 10,
      step = 1
    ),
    
    # Input: Sample Size ----
    sliderInput(
      inputId = "sample_size",
      label = "Sample Size",
      min = 1,
      max = 10000,
      value = 10,
      step = 1
    ),
    
  ),
  
  # Main panel for displaying outputs ----
  mainPanel(# *Output() functions
    plotOutput(outputId = "hist"))
)

server <- function(input, output) {
  output$hist <- renderPlot({
    input_to_hist(distributions_list, input$distribution, num_of_samples, sample_size)
  })
}

shinyApp(ui = ui, server = server)

################################################################
## REFERENCES
##
## How to Start Shiny tutorial
## Garrett Grolemund 
## 02.05.21
## https://shiny.rstudio.com/tutorial/#written-tutorials 
##
################################################################
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
      "Bernoulli" = "bern_",
      "Bimodal" = "bimod_",
      "Binomial" = "binom_",
      "Chi-Square" = "chi_",
      "F" = "f_",
      "Logistic" = "log_",
      "Normal Distribution (Gaussian)" = "norm_",
      "Poisson" = "pois_",
      "Student t" = "stu_t",
      "Uniform" = "uni_"
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
    hist(rnorm(n = input$sample_size), main = "Central Limit Theorem", 
         xlab = "", ylab = "Number of Samples", col = "Darkcyan",
         xlim = c(-5,5), labels = T)
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
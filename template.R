## R Shiny Template
## 02.05.21
## Piers Kirk, pfk3jd

source("/Users/pierskirk/Documents/GitHub/NesselroadeSTATSwikiShinyApps/functions_to_create_hists.R")
library(shiny)

ui <- fluidPage(
  titlePanel("The Central Limit Theorem"),
  selectInput(
    "distribution",
    "Distribution:",
    c("Bernoulli" = "Bernoulli",
      "Bimodal" = "Bimodal",
      "Binomial" = "Binomial",
      "Chi-Square" = "Chi-Square",
      "F" = "F",
      "Logistic" = "Logistic",
      "Normal Distribution (Gaussian)" = "Normal Distribution (Gaussian)",
      "Poisson" = "Poisson",
      "Student t" = "Student t",
      "Uniform" = "Uniform")), 
  sidebarPanel(
    sliderInput(
      inputId = "num_of_samples",
      label = "Number of Samples",
      min = 1,
      max = 10000,
      value = 10,
      step = 1),
    sliderInput(
      inputId = "sample_size",
      label = "Sample Size",
      min = 1,
      max = 10000,
      value = 10,
      step = 1),
  ),
  conditionalPanel(condition = "input.distribution=='Bernoulli'|input.distribution=='Binomial'", 
                   sidebarPanel(
                     sliderInput(
                       inputId = "prob",
                       label = "Probability",
                       min = 0,
                       max = 1,
                       value = 0.5,
                       step = 0.01),
                   ),),
  ## INPUT SOMETHING FOR BIMODAL
  conditionalPanel(condition = "input.distribution=='Binomial'", 
                   sidebarPanel(
                     sliderInput(
                       inputId = "size",
                       label = "Size",
                       min = 1,
                       max = 1000,
                       value = 1,
                       step = 10),
                   ),),
  conditionalPanel(condition = "input.distribution=='Chi-Square'|input.distribution=='Student t'", 
                   sidebarPanel(
                     sliderInput(
                       inputId = "df",
                       label = "Degrees of Freedom",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 1),
                   ),),
  conditionalPanel(condition = "input.distribution=='F'", 
                   sidebarPanel(
                     sliderInput(
                       inputId = "df_1",
                       label = "Degrees of Freedom 1",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 1),
                     sliderInput(
                       inputId = "df_2",
                       label = "Degrees of Freedom 2",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 1),
                   ),),
  conditionalPanel(condition = "input.distribution=='Logistic'", 
                   sidebarPanel(
                     sliderInput(
                       inputId = "location_",
                       label = "Location (Mean)",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 0.5),
                     sliderInput(
                       inputId = "scale_",
                       label = "Scale (Variance)",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 0.5),
                   ),),
  conditionalPanel(condition = "input.distribution=='Normal Distribution (Gaussian)'", 
                   sidebarPanel(
                     sliderInput(
                       inputId = "mean",
                       label = "Mean",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 0.5),
                     sliderInput(
                       inputId = "sd",
                       label = "Standard Deviation",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 0.5),
                   ),),
  conditionalPanel(condition = "input.distribution=='Poisson'", 
                   sidebarPanel(
                     sliderInput(
                       inputId = "lambda",
                       label = "Lambda",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 0.5),
                   ),),
  conditionalPanel(condition = "input.distribution=='Uniform'", 
                   sidebarPanel(
                     sliderInput(
                       inputId = "Range",
                       label = "Range",
                       min = 1,
                       max = 100,
                       value = c(1,10),
                       step = 1,
                       dragRange = TRUE),
                   ),),
  # Main panel for displaying outputs ----
  mainPanel(# *Output() functions
    plotOutput(outputId = "hist"))
)

server <- function(input, output) {
  output$hist <- renderPlot({hist(30,10)
    ##input_to_hist(distributions_list, input$distribution, num_of_samples, sample_size)
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
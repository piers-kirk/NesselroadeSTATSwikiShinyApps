## 08.14.21
## Piers Kirk, pfk3jd

source(
  "/Users/pierskirk/Documents/GitHub/NesselroadeSTATSwikiShinyApps/functions_to_create_hists.R"
)
library(shiny)

ui <- fluidPage(
  titlePanel("The Central Limit Theorem"),
  selectInput(
    inputId = "distribution",
    label = "Distribution:",
    c(
      "Bernoulli" = "bernoulli",
      "Bimodal" = "bimodal",
      "Binomial" = "binomial",
      "Chi-Square" = "chi_square",
      "F" = "f",
      "Logistic" = "logistic",
      "Normal Distribution (Gaussian)" = "gaussian",
      "Poisson" = "poisson",
      "Student's t" = "students_t",
      "Uniform" = "uniform"
    )
  ),
  sidebarPanel(
    sliderInput(
      inputId = "num_of_samples",
      label = "Number of Samples",
      min = 1,
      max = 10000,
      value = 10,
      step = 1
    ),
    sliderInput(
      inputId = "sample_size",
      label = "Sample Size",
      min = 1,
      max = 10000,
      value = 10,
      step = 1
    ),
  ),
  conditionalPanel(condition = "input.distribution=='bernoulli'",
                   sidebarPanel(
                     sliderInput(
                       inputId = "prob",
                       label = "Probability",
                       min = 0,
                       max = 1,
                       value = 0.5,
                       step = 0.01
                     ),
                   ),),
  ## INPUT SOMETHING FOR BIMODAL
  conditionalPanel(condition = "input.distribution=='binomial'",
                   sidebarPanel(
                     sliderInput(
                       inputId = "prob",
                       label = "Probability",
                       min = 0,
                       max = 1,
                       value = 0.5,
                       step = 0.01
                     ),
                     sliderInput(
                       inputId = "size",
                       label = "Size",
                       min = 1,
                       max = 1000,
                       value = 1,
                       step = 10
                     ),
                   ),),
  conditionalPanel(condition = "input.distribution=='chi_square'|input.distribution=='students_t'",
                   sidebarPanel(
                     sliderInput(
                       inputId = "df",
                       label = "Degrees of Freedom",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 1
                     ),
                   ),),
  conditionalPanel(condition = "input.distribution=='f'",
                   sidebarPanel(
                     sliderInput(
                       inputId = "df_1",
                       label = "Degrees of Freedom 1",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 1
                     ),
                     sliderInput(
                       inputId = "df_2",
                       label = "Degrees of Freedom 2",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 1
                     ),
                   ),),
  conditionalPanel(condition = "input.distribution=='logistic'",
                   sidebarPanel(
                     sliderInput(
                       inputId = "location",
                       label = "Location (Mean)",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 0.5
                     ),
                     sliderInput(
                       inputId = "scale",
                       label = "Scale (Variance)",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 0.5
                     ),
                   ),),
  conditionalPanel(condition = "input.distribution=='gaussian'",
                   sidebarPanel(
                     sliderInput(
                       inputId = "mean",
                       label = "Mean",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 0.5
                     ),
                     sliderInput(
                       inputId = "sd",
                       label = "Standard Deviation",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 0.5
                     ),
                   ),),
  conditionalPanel(condition = "input.distribution=='poisson'",
                   sidebarPanel(
                     sliderInput(
                       inputId = "lambda",
                       label = "Lambda",
                       min = 1,
                       max = 100,
                       value = 1,
                       step = 0.5
                     ),
                   ),),
  conditionalPanel(condition = "input.distribution=='uniform'",
                   sidebarPanel(
                     sliderInput(
                       inputId = "range",
                       label = "Range",
                       min = 1,
                       max = 100,
                       value = c(1, 10),
                       step = 1,
                       dragRange = TRUE,
                     ),
                   ),),
  mainPanel(plotOutput(outputId = "my_hist"))
)

server <- function(input, output) {
  output$my_hist <- renderPlot({
    if (input$distribution == 'bernoulli') {
      dist_vec <- rbinom(population_size, size = 1, prob = input$prob)
      sample_vec <- 
        sampling_distribution(bern_dist_vec, input$num_of_samples, input$sample_size)
    } else {
      hist(20, 20)
    }
    create_histograms(input$distribution, dist_vec, sample_vec)
  })
}

shinyApp(ui = ui, server = server)

## ToDos:
#### UI: 
###### implement bimodal distribution 
###### display consistency, the histograms should be displayed in the same place regardless of distribution type
###### confirm parameters of scales for each distribution type (meeting)
###### decide on default values for scales (meeting)
#### Server:
###### implement histograms for remaining distributions 




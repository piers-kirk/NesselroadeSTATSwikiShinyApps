## R Shiny Template
## 02.05.21 
## Piers Kirk, pfk3jd 
## Note: when the app is finalized, create 
## new file inside sub-directory of wd and 
## save as app.R 

## stopped at minute 33:16 of shiny apps tutorial

library(shiny)
ui <- fluidPage(
  # *Input() functions,
  sliderInput(inputId = "num",
              label = "Please select the number of samples",
              value = 10, min = 1, max = 10000, step = 1),
  # *Output() functions
  plotOutput(outputId = "hist")  
)

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(n = input$num), main = "Central Limit Theorem", 
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

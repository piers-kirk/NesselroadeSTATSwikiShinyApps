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

## To Dos
## the app should show sampling from non-normal distributions in addition 
## to normal distribution + plotting should include sample means as opposed to normal 
## functions to consider: rnorm - see documentation: 
## lamda - per unit time what is the average amount of occurences that you think will happen
## http://www.stat.umn.edu/geyer/old/5101/rlook.html 
## binomial ( 2 ) , normal ( 2 ) , poisson ( 1 ) , uniform ( 2 )  
## use the r functions 

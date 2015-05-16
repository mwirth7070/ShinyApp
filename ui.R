library(shiny)

# Define UI for miles per gallon application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Esophageal Cancer: Smoking, Alcohol and Age"),
  
  # Sidebar with controls to select the variable to plot against
  # mpg and to specify whether outliers should be included
  sidebarLayout(
    sidebarPanel(
      strong("Instructions:"),
      em("Select the criterion to use for generating associated box plots representing the percentage of esophageal cancer cases within test groups."),
      p(),
      selectInput("variable", "Variable:",
                  c("Tobacco Consumption" = "tobgp",
                    "Alcohol Consumption" = "alcgp",
                    "Age Group" = "agegp")),
  
      checkboxInput("outliers", "Show outliers", FALSE)
    ),
    
	 # Show the caption and plot of the requested variable against
	 # number of cases
    mainPanel(
      strong("These box plots reflect cancer rates from 0 - 100% for a particular test group, in the categories specified."),
      h3(textOutput("caption")),
      
      plotOutput("ncasesPlot")
    )
  )
))

library(shiny)
library(datasets)

# We tweak the "am" field to have nicer factor labels. Since
# this doesn't rely on any user inputs we can do this once at
# startup and then use the value throughout the lifetime of the
# application
esophData <- esoph

nperc <- (esoph$ncases / esoph$ncontrol) * 100

# Define server logic required to plot various variables against
# number of cases
shinyServer(function(input, output) {
  
  # Compute the formula text in a reactive expression since it is
  # shared by the output$caption and output$ncasesPlot functions
  formulaText <- reactive({
    paste("nperc ~", input$variable)  #paste("ncases ~", input$variable)
  })
   
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against ncases and
  # only include outliers if requested
  output$ncasesPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = esophData,
            outline = input$outliers
            )
  })
})

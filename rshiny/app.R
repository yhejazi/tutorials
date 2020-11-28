# Load data and libraries -------------------------------------------
library("shiny")
source("ui.R")
source("server.R")

# Create shiny application ------------------------------------------
shinyApp(ui = ui, server = server)
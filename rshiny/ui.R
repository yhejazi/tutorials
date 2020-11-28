# Load libraries, data -----------------------------------------------
characters <- read.csv("data/characters.csv")


# Page 1 - Introduction ----------------------------------------------
intro_panel <- tabPanel(
  "Introduction",
  
  titlePanel("Characteristics of Mario Kart Drivers"),
  
  img(src = "mariokart8.jpg", height = 400, width = 800),
  br(), br(),
  
  p("This is an R Shiny tutorial on how to create an application with multiple tabs and 
    interactive visualizations. In the second tab, we use character data from Mario Kart 
    8 in order to explore characteristics of each driver."),
  
  p(a(href = "https://www.kaggle.com/barelydedicated/mariokart8?select=characters.csv", "Data Source (Kaggle)"))
)

# Page 2 - Vizualization -------------------------------------------
select_values <- colnames(characters)
select_values <- select_values[! select_values %in% c('Character', 'Class')] # remove unwanted columns

sidebar_content <- sidebarPanel(
  selectInput(
    "y_var",
    label = "Y Variable",
    choices = select_values,
    selected = 'Speed'
  )
)

main_content <- mainPanel(
  plotOutput("plot")
)

second_panel <- tabPanel(
  "Visualization",
  titlePanel("What are the Characteristics of each Mario Kart 8 Driver?"),
  p("Use the selector input below to choose which variable you would like to see."),
  sidebarLayout(
    sidebar_content, main_content
  )
)



# User Interface -----------------------------------------------------
ui <- navbarPage(
  "Mario Kart Characteristics",
  intro_panel,
  second_panel
)
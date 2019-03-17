library(d3heatmap)
library(shiny)
library(shinyalert)
library(shinyBS)
library(shinyjs)
library(shinythemes)

options(stringsAsFactors=FALSE)
options(shiny.maxRequestSize = 50*1024^2)

ui <- fluidPage(  

tags$head(
	tags$style(HTML("
	.shiny-output-error {
	visibility: hidden;
}
body {
	#background-color: #23443333;
}
body, label, input, button, select { 
	font-family: 'Arial';
}"))
  ), 
  theme = shinytheme("sandstone"),  useShinyjs(), useShinyalert(), 
	sidebarLayout(
		sidebarPanel(
		tabsetPanel(id = "tabset",
		tabPanel("Analyse",
			fileInput("file1", "Choose Targets", multiple = TRUE, accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv")),
			actionButton("goButton", "Analyse dataset!")
		),
		tabPanel("Compare",
			fileInput("file2A", "Annotation-1", multiple = TRUE, accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv")),
			fileInput("file2B", "Annotation-2", multiple = TRUE, accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv")),
			fileInput("file2C", "Annotation-3", multiple = TRUE, accept = c("text/csv", "text/comma-separated-values,text/plain", ".csv")),
			actionButton("goButton", "Analyse dataset!")
		)
		)
		),
		mainPanel(
			useShinyjs(),
			plotOutput(outputId = "plot"),
			plotOutput(outputId = "plot2")
		)
	)
)
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
  theme = shinytheme("united"),  useShinyjs(), useShinyalert(), 
	sidebarLayout(
		sidebarPanel(
		tabsetPanel(id = "tabset",
		tabPanel("TraitCorr - finding significantly correlating traits",
			selectInput("sumo", "SUMO protein:", c("SUMO protein"="sumo_protein","SUMO E1"="sumo_e1","SUMO E2"="sumo_e2","SUMO E3"="sumo_e3","SUMO Protease"="sumo_protease")),
			selectInput("species", "Species:", c("Arabidopsis thaliana"="arabidopsis","Triticum aestivum"="taestivum")),
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
library(d3heatmap)
library(officer)
library(shiny)
library(shinyalert)
library(shinyBS)
library(shinyjs)
library(shinythemes)

options(stringsAsFactors=FALSE)

server <- function(input, output, session)
{
	v <- reactiveValues(species=NULL, sumo=NULL)

	observeEvent(input$sumo,{
		v$sumo=input$sumo
	})

	observeEvent(input$species,{
		v$species=input$species
	})

	observeEvent(input$goButton,{
		print("goButton")
		source("methods.R")
		
		v$file1=input$file1$datapath
		output$plot=renderPlot({
			my_plot=print_genes(v)
			print(my_plot)
		})
	})

}

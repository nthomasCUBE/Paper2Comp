library(shiny)
library(shinyalert)
library(shinyBS)
library(shinyjs)
library(shinythemes)

options(stringsAsFactors=FALSE)
options(stringsAsFactors=FALSE)
options(shiny.maxRequestSize = 50*1024^2)

ui <- fluidPage(  

tags$head(
	tags$style(HTML("
	.shiny-output-error {
		visibility: hidden;
	}
	.a {
	    color: #555;
	    cursor: default;
	    background-color: #ff000044;
	    border: 1px solid #ddd;
	    border-bottom-color: transparent;
	}

	body {
		background-color: #23443333;
		font-size: 22px;
	}

	input {
	  font-family: 'Lobster', cursive;
	  font-weight: 500;
	  line-height: 1.1;
	  color: #ad1d28;
	}

	button {
	   background-color: #ff0000;
	   color: #ff0000;
	}


	body, label, input, button, select { 
		font-family: 'Arial';
}"))
  ), 
   useShinyjs(), useShinyalert(), 
	sidebarLayout(
		sidebarPanel(
		tabsetPanel(id = "tabset",
		tabPanel("paper2Comp - comparing papers based on word frequencies",
			fileInput("file1", "Paper 1", multiple = TRUE, accept = c("text/text", ".pdf")),
			fileInput("file2", "Paper 2", multiple = TRUE, accept = c("text/text", ".pdf")),
			numericInput("min_freq", "minimum frequency per term", 1, min = 1, max = 100, step = 1,  width = NULL),
			fileInput("genelist", "gene lists", multiple = TRUE, accept = c("text/text", ".pdf")),
  			actionButton("goButton", "Analyse dataset!")))),
		mainPanel(
			useShinyjs(),
			plotOutput(outputId = "plot")
		)
	)
)
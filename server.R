library(shiny)
library(shinyalert)
library(shinyBS)
library(shinyjs)
library(shinythemes)

options(stringsAsFactors=FALSE)

server <- function(input, output, session)
{
	v <- reactiveValues(file1=NULL, file2=NULL, measure=NULL, species=NULL, cfile1=NULL, cfile2=NULL, genelist=NULL)

	#	----------------------------------------------
	#	Paper 1
	#	----------------------------------------------
	observeEvent(input$file1,{
		source("methods.R")
		v$file1=input$file1
		cn1=colnames(read.csv(v$file1$datapath,sep="\t",header=T))
		cn1=cn1[2:(length(cn1)-1)]
		updateSelectInput(session, "sfile1",
		      label = "",
		      choices = cn1,
		      selected = cn1[1]
	    	)
	})

	#	----------------------------------------------
	#	Paper 2
	#	----------------------------------------------
	observeEvent(input$file2,{
		source("methods.R")
		v$file2=input$file2
		cn1=colnames(read.csv(v$file2$datapath,sep="\t",header=T))
		cn1=cn1[2:(length(cn1)-1)]
		updateSelectInput(session, "sfile2",
		      label = "",
		      choices = cn1,
		      selected = cn1[1]
	    	)
	})

	#	----------------------------------------------
	#	min_freq
	#	----------------------------------------------
	observeEvent(input$min_freq,{
		source("methods.R")
		v$min_freq=input$min_freq
	})

	#	----------------------------------------------
	#	genelist
	#	----------------------------------------------
	observeEvent(input$genelist,{
		source("methods.R")
		v$genelist=input$genelist
	})

	#	----------------------------------------------
	#	Go Button
	#	----------------------------------------------
	observeEvent(input$goButton,{
		source("methods.R")
		cmp_papers(input$file1$datapath,input$file2$datapath,output,input$min_freq,v$genelist)
	})
}

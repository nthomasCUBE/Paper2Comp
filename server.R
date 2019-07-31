library(shiny)
library(shinyalert)
library(shinyBS)
library(shinyjs)
library(shinythemes)

options(stringsAsFactors=FALSE)

server <- function(input, output, session)
{
	v <- reactiveValues(file1=NULL, file2=NULL, measure=NULL, species=NULL, cfile1=NULL, cfile2=NULL)

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
	#	Paper 3
	#	----------------------------------------------
	observeEvent(input$file3,{
		source("methods.R")
		v$file3=input$file3
		cn1=colnames(read.csv(v$file3$datapath,sep="\t",header=T))
		cn1=cn1[2:(length(cn1)-1)]
		updateSelectInput(session, "sfile3",
		      label = "",
		      choices = cn1,
		      selected = cn1[1]
	    	)
	})

	#	----------------------------------------------
	#	Paper 4
	#	----------------------------------------------
	observeEvent(input$file4,{
		source("methods.R")
		v$file4=input$file4
		cn1=colnames(read.csv(v$file4$datapath,sep="\t",header=T))
		cn1=cn1[2:(length(cn1)-1)]
		updateSelectInput(session, "sfile4",
		      label = "",
		      choices = cn1,
		      selected = cn1[1]
	    	)
	})

	#	----------------------------------------------
	#	Paper 5
	#	----------------------------------------------
	observeEvent(input$file5,{
		source("methods.R")
		v$file5=input$file5
		cn1=colnames(read.csv(v$file5$datapath,sep="\t",header=T))
		cn1=cn1[2:(length(cn1)-1)]
		updateSelectInput(session, "sfile5",
		      label = "",
		      choices = cn1,
		      selected = cn1[1]
	    	)
	})

	#	----------------------------------------------
	#	Go Button
	#	----------------------------------------------
	observeEvent(input$goButton,{
		source("methods.R")
		cmp_papers(input$file1$datapath,input$file2$datapath,input$file3$datapath,input$file4$datapath,input$file5$datapath)
	})
}

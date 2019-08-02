library(wordcloud)
library(pdftools)
library(tm)

options(stringsAsFactors=FALSE)

cmp_papers=function(A1, A2, output){

	output$plot=renderPlot({
	
		print("cmp_papers")
		if(!(length(A1)>0 && length(A2)>0)){
			return;
		}

		output1=pdf_text(A1)
		output2=pdf_text(A2)

		docs=Corpus(VectorSource(output2[2:length(output2)]))
		toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
		docs <- tm_map(docs, toSpace, "/")
		docs <- tm_map(docs, toSpace, "@")
		docs <- tm_map(docs, toSpace, "\\|")
		docs <- tm_map(docs, removeWords, stopwords("english"))
		docs <- tm_map(docs, stripWhitespace)
		docs <- tm_map(docs, removePunctuation)
		dtm <- TermDocumentMatrix(docs)
		m <- as.matrix(dtm)
		v <- sort(rowSums(m),decreasing=TRUE)
		d2 <- data.frame(word = names(v),freq=v)

		docs=Corpus(VectorSource(output1[2:length(output1)]))
		toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
		docs <- tm_map(docs, toSpace, "/")
		docs <- tm_map(docs, toSpace, "@")
		docs <- tm_map(docs, toSpace, "\\|")
		docs <- tm_map(docs, removeWords, stopwords("english"))
		docs <- tm_map(docs, stripWhitespace)
		docs <- tm_map(docs, removePunctuation)
		dtm <- TermDocumentMatrix(docs)
		m <- as.matrix(dtm)
		v <- sort(rowSums(m),decreasing=TRUE)
		d <- data.frame(word = names(v),freq=v)

		d=cbind(d,rep("black",dim(d)[1]))
		d[d[,1]%in%d2[,1],3]="red"
		colnames(d)[3]="color"
		set.seed(1234)
		wordcloud(words = d$word, freq = d$freq, min.freq = 1,
			  max.words=200, random.order=FALSE, rot.per=0.35, 
			  colors=d$color)
	})
}

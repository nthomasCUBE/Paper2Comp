options(stringsAsFactors=FALSE)

cmp_papers=function(A1, A2, A3, A4, A5){

	library(wordcloud)
	library(pdftools)

	print("cmp_papers")
	
	output1=pdf_text(A1)
	output2=pdf_text(A2)
	output3=pdf_text(A3)
	output4=pdf_text(A4)
	output5=pdf_text(A5)

	par(mfrow=c(2,3))
	w1=wordcloud(output1[1])
	wordcloud(output2[1])
	wordcloud(output3[1])
	wordcloud(output4[1])
	wordcloud(output5[1])


	wordcloud(c(output1,output2,output3,output4,output5))

	output1=unique(output1)
	output2=unique(output2)
	output3=unique(output3)
	output4=unique(output4)
	output5=unique(output5)

	wordcloud(c(output1,output2,output3,output4,output5))
	
	options(stringsAsFactors=FALSE)

	docs=Corpus(VectorSource(output2[2:5]))
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

	docs=Corpus(VectorSource(output1[2:5]))
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
	}

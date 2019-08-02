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


}
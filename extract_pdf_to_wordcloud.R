library(wordcloud)
library(pdftools)

output=pdf_text("C:/Users/thoma/Documents/A.pdf")
wordcloud(output[1])

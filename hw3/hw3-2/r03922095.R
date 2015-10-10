url      <- 'https://ceiba.ntu.edu.tw/course/6d0f76/content/1001_chinatimes.txt'
filename <- 'r03922095.txt'

download.file(url, destfile = filename)
con <- file(filename, open = 'r', encoding = 'UTF-8')

library(jiebaR)
words_vector = (worker() <= )
words_char   = paste(words_vector,collapse=' ')
cat(words_char)

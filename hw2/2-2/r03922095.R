url <- 'https://ceiba.ntu.edu.tw/course/6d0f76/content/MYJ1030101.clean.txt'
download.file(url, destfile = 'MYJ1030101.clean.txt')

file_name <- 'MYJ1030101.clean.txt'
con <- file(file_name, open = 'r', encoding = 'UTF-8')

word_list <- character(0L)

while (length(line <- readLines(con, n = 1, warn = FALSE)) > 0) {
  word_list <- append(word_list, strsplit(line, split = ' ')[[1]])
}

word_list <- word_list[!(word_list == '　')]

library(tmcn)

# processing stop words
stop_word_tw <- toTrad(stopwordsCN())
stop_word_free_list <- word_list[!(word_list %in% stop_word_tw)]

# counting words
word_count <- sort(table(stop_word_free_list), decreasing = TRUE)
# select words at least 3
result <- word_count[word_count >= 3]

# write result
write.table(result, 'r03922095.txt')
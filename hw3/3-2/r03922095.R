# url and file name
url      <- 'https://ceiba.ntu.edu.tw/course/6d0f76/content/1001_chinatimes.txt'
stu_id   <- 'r03922095'
encoding_type <- 'UTF-8'

# download and open
txt_file <- paste(stu_id, 'txt', sep = '.')
download.file(url, destfile = txt_file)
raw_word <- scan(txt_file, what = 'char', encoding = encoding_type)
raw_word <- gsub('\xff', '', raw_word)

# cut words
library(jiebaR)
words_vector <- (worker() <= raw_word)
words_char   <- paste(words_vector, collapse=' ')

# write .seg file
seg_file <- paste(stu_id, 'seg', sep = '.')
con      <- file(seg_file, open = 'w', encoding = encoding_type)
write(words_char, file = con)
close(con)

# write .csv file
csv_file <- paste(stu_id, 'csv', sep = '.')
result   <- sort(table(words_vector), decreasing = TRUE)
con      <- file(csv_file, open = 'w', encoding = encoding_type)
write.csv(result, file = con)
close(con)
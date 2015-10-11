STU_ID=r03922095
URL=https://ceiba.ntu.edu.tw/course/6d0f76/content/1001_chinatimes.txt
wget $URL -O $STU_ID.txt
cat $STU_ID.txt | Rscript jieba.R > $STU_ID.seg
cat $STU_ID.seg | sed -e "s/[^[:alpha:]]\+/\n/g" | sed -e "/^$/d" | tr [:upper:] [:lower:] | sort | uniq -c | sort -nr -k 1 > $STU_ID.csv

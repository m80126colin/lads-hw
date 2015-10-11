wget https://ceiba.ntu.edu.tw/course/6d0f76/content/MYJ1030101.clean.txt
sed -e 's/[[:space:]]\{1,\}/\n/g' MYJ1030101.clean.txt | sed -e '/^$/d' | sort | uniq -c | sort -nr -k 1 > r03922095.txt

for i in $(cat ~/list.txt); do
    touch ~/article/$i.csv;
    for j in $(find $i -name "_pdf" | grep -v "KJ"); do
        echo "$j" | tee -a ~/article/$i.csv;
        pdffonts $j | sed "s/\s\+/,/g" | sed "1,2d" | tee -a ~/article/$i.csv;
    done; 
done
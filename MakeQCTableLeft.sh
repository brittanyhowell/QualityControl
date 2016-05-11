#!/bin/bash


if [ -f tablefileL.tex ]; then
rm tablefileL.tex
fi

if [ -f Line1.txt ]; 
then rm Line1.txt
fi

# Write beginning of table information
echo "\begin{landscape}" >> tablefileL.tex
echo "\begin{longtable}{ |p{5cm} | p{2cm} p{3cm} p{3cm} p{3cm} p{3cm} p{3cm}|}" >> tablefileL.tex
echo "\hline" >> tablefileL.tex
echo "Read Name & Basic Statistics & Per base sequence quality & Per tile sequence quality & Per sequence quality scores & Per base sequence content & Per sequence GC content  \\\\ " >> tablefileL.tex
echo "\hline\hline \endhead" >>tablefileL.tex
echo "\hline \endfoot" >> tablefileL.tex


for folder in ./Mouse-plots-one/Folders/* ; do

cd ${folder}

if [ -f name.txt ]; 
then rm name.txt
fi

if [ -f PassFailOne.txt ]; 
then rm PassFailOne.txt
fi 

if [ -f Line1a.txt ]; 
then rm Line1a.txt
fi

if [ -f Line2a.txt ]; 
then rm Line2a.txt
fi

if [ -f Line1.txt ]; 
then rm Line1.txt
fi

if [ -f Line2.txt ]; 
then rm Line2.txt
fi

if [ -f PassFailTwo.txt ]; 
then rm PassFailTwo.txt
fi

if [ -f CompleteLine.txt ]; 
then rm CompleteLine.txt
fi


# Read the name of the sequence read
sed 's/ /*/g' summary.txt | awk 'FNR == 1 {print $3}' | sed 's;_; ;g' > name.txt

# Print the PASS FAIL list for first 6 lines
awk '{print $1}' summary.txt| sed -n 1,6p > PassFailOne.txt

# Print the PASS FAIL list for next 6 lines
awk '{print $1}' summary.txt| sed -n 7,12p > PassFailTwo.txt

# Concatenate into a single line
cat name.txt PassFailOne.txt >> Line1a.txt



# Replace newlines with &s, replace final & with newline
cat Line1a.txt | tr '\n' '&' | sed 's/&$/\\\\/'  > Line1.txt

# Move file to base directory and copy into table
mv Line1.txt /Users/brittanyhowell/Documents/University/Honours_2016/Project/QualityControl
cd /Users/brittanyhowell/Documents/University/Honours_2016/Project/QualityControl
cat Line1.txt >> tablefileL.tex
echo "\hline" >> tablefileL.tex
rm Line1.txt

done

echo "\caption{Results from FASTQC analysis of paired end reads generated from }" >> tablefileL.tex
echo "\end{longtable}" >> tablefileL.tex
echo "\end{landscape}" >> tablefileL.tex
			

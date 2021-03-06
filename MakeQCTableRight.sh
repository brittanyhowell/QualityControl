#!/bin/bash

dataDir=/Users/brittanyhowell/Documents/University/Honours_2016/Project/QualityControl/trimGalore
#dataDir=/Users/brittanyhowell/Documents/University/Honours_2016/Project/QualityControl/Mouse-plots-one

echo "Initialising table"
date

if [ -f tablefileR.tex ]; then
rm tablefileR.tex
fi

if [ -f Line1.txt ]; 
then rm Line1.txt
fi

# Write beginning of table information
echo "\begin{landscape}" >> tablefileR.tex
echo "\begin{longtable}{ |p{5cm} | p{2cm} p{3cm} p{3cm} p{3cm} p{3cm} p{3cm}|}" >> tablefileR.tex
echo "\caption{Results from FASTQC analysis of HENMT1 read data after processing with Trim Galore.}\\\\" >> tablefileR.tex
#echo "\caption{Results from FASTQC analysis of paired end reads generated from HenMT1 data.}\\\\" >> tablefileR.tex

echo "\hline" >> tablefileR.tex
echo "Read Name & Per base N content & Sequence Length Distribution & Sequence Duplication Levels & Overrepresented sequences & Adapter Content & Kmer Content   \\\\ " >> tablefileR.tex
echo "\hline\hline \endhead" >>tablefileR.tex
echo "\hline \endfoot" >> tablefileR.tex


for folder in ${dataDir}/Folders/* ; do

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

# Print the PASS FAIL list for next 6 lines
awk '{print $1}' summary.txt| sed -n 7,12p > PassFailTwo.txt

# Concatenate into a single line
cat name.txt PassFailTwo.txt >> Line1a.txt
rm name.txt
rm PassFailTwo.txt

# Replace newlines with &s, replace final & with newline
cat Line1a.txt | tr '\n' '&' | sed 's/&$/\\\\/'  > Line1.txt
rm Line1a.txt

# Move file to base directory and copy into table
mv Line1.txt /Users/brittanyhowell/Documents/University/Honours_2016/Project/QualityControl
cd /Users/brittanyhowell/Documents/University/Honours_2016/Project/QualityControl
cat Line1.txt >> tablefileR.tex
echo "\hline" >> tablefileR.tex
rm Line1.txt

done

#echo "\label{QCRawR}" >> tablefileR.tex
echo "\label{QCTrimR}" >> tablefileR.tex

echo "\end{longtable}" >> tablefileR.tex
echo "\end{landscape}" >> tablefileR.tex

mv tablefileR.tex ${dataDir}
			
echo "Complete Right side"
date
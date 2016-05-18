#!/bin/bash

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
cat name.txt PassFailTwo.txt >> Line2a.txt 


# Replace newlines with &s, replace final & with newline
cat Line1a.txt | tr '\n' '&' | sed 's/&$/ /' > Line1.txt
cat Line2a.txt | tr '\n' '&' | sed 's/&$/ /' > Line2.txt

#!/bin/bash

readDir=/Users/brittanyhowell/Documents/University/Honours_2016/Project/Data/TranscriptomeData/Henmt1_mRNAseq_mouse/raw_data
outDIR=/Users/brittanyhowell/Documents/University/Honours_2016/Project/QualityControl/trimGalore

echo "Initialising files:"
date

if [ -d $outDIR ]; then
    echo "Folder $outDIR exists ..."
else
    mkdir $outDIR
fi

cd ${readDir} 

FILES=$(ls *_R1.fastq.gz)


for f in ${FILES} ;
do 

	FILENAME=${f%_R1.fastq.gz}
	echo "Commencing trim_galore $FILENAME"
	trimgalore.pl --stringency 6 -o ${outDIR} --paired --fastqc_args "-t 8" ${readDir}/${FILENAME}_R1.fastq.gz ${readDir}/${FILENAME}_R2.fastq.gz
done

echo "Program concludes:"
date

# --stringency: How many bases need to match the adapter before it removes it. Zhipeng uses 6.
# -o: Output directory
# --paired: performs trimming on paired reads, has additional, paired-specific validationi steps
# --fastqc_args allows arguments which are intended for the fastqc run
	# "-t 8": number of  files which can be processed simultaneously. Each thread is allocated 250MB of memory, so there shouldn't be more than the computer can handle, nor more than 6 threads on a 32 bit machine 

## Data: 04/09/2014
## Zhipeng
## This bash script is used to run trim_galore for pair-end read

##get working folders
wkDIR=/mnt/zhipeng/MCF7_RNA_seq_010415
fastqDIR=${wkDIR}/data/fastq/merged
outDIR=${wkDIR}/results/trim_galore

##run trim_galore for all fastq files in ${fastqDIR} and put trimmed files in ${outDIR}
echo "The whole program starts at: "
date

if [ -d $outDIR ]; then
    echo "Folder $outDIR exists ..."
else
    mkdir $outDIR
fi

cd ${fastqDIR}
FILES=$(ls *_R1.fastq.gz)

cd ${outDIR}
for f in $FILES
do
    filename=${f%_R1.fastq.gz}
    echo "Now is processing $f ..."
    date
    trim_galore --stringency 6 -o ${outDIR} --paired --fastqc_args "-t 8" ${fastqDIR}/${filename}_R1.fastq.gz ${fastqDIR}/${filename}_R2.fastq.gz

done

echo -ne "The whole program ends at: "
date
